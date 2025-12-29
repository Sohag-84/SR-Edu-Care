import 'package:any_image_view/any_image_view.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/course_section/course_section_bloc.dart';
import 'package:video_player/video_player.dart';

class CourseView extends StatefulWidget {
  final String courseId;
  const CourseView({super.key, required this.courseId});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late VideoPlayerController _controller;

  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    context.read<CourseSectionBloc>().add(
      FetchedCourseSections(courseId: widget.courseId),
    );
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://res.cloudinary.com/dm1xze4ej/video/upload/v1766935670/d4wdgcenjr8hzzadmrux.mp4',
            ),
          )
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });

    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: true,
      allowedScreenSleep: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseSectionBloc, CourseSectionState>(
        builder: (context, state) {
          if (state is CourseSectionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CourseSectionError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is CourseSectionLoaded) {
            return Column(
              children: [
                Gap(kToolbarHeight),
                //video player
                SizedBox(
                  height: 190.h,
                  width: double.infinity,
                  child: _controller.value.isInitialized
                      ? Chewie(controller: chewieController)
                      : Center(child: const CircularProgressIndicator()),
                ),
                //others details
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0.w),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          state.courseSection.courseTitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //description
                        Text(
                          state.courseSection.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12.sp,
                            overflow: TextOverflow.ellipsis,
                            color: greyColor,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        //ratings
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 14.sp),
                            SizedBox(width: 4.w),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "(ratings)",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),

                        //instructor name
                        Row(
                          children: [
                            state.courseSection.creator.photoUrl.isEmpty
                                ? Icon(Icons.person_2_outlined)
                                : AnyImageView(
                                    imagePath:
                                        state.courseSection.creator.photoUrl,
                                    width: 30.w,
                                    height: 30.h,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                            SizedBox(width: 8.w),
                            Text(
                              state.courseSection.creator.name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        Gap(10.h),

                        //video sections
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.courseSection.sections.length,
                            itemBuilder: (BuildContext context, int index) {
                              final section =
                                  state.courseSection.sections[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    section.title,
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                                  section.lectures.isEmpty
                                      ? ListTile(
                                          title: Text(
                                            "Lectures coming soon...",
                                            style: TextStyle(
                                              color: greyColor,
                                              fontSize: 13.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: section.lectures.length,
                                          itemBuilder:
                                              (
                                                BuildContext context,
                                                int lectureIndex,
                                              ) {
                                                final lecture = section
                                                    .lectures[lectureIndex];

                                                return ListTile(
                                                  leading: Icon(
                                                    Icons.play_circle_outline,
                                                  ),
                                                  title: Text(
                                                    lecture.title,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: greyColor,
                                                      fontSize: 13.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  trailing: Text(
                                                    "10:00",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                );
                                              },
                                        ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
