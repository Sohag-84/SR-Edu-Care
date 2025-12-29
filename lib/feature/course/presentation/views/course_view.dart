import 'package:any_image_view/any_image_view.dart';
import 'package:chewie/chewie.dart';
import 'package:sr_edu_care/core/constants/export.dart';
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
      body: Column(
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
                children: [
                  Text(
                    "JavaScript for Beginners: Learn JavaScript from Scratch",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //description
                  Text(
                    "Learn JavaScript from scratch with this comprehensive course designed for beginners. Master the fundamentals and start building dynamic web applications today!",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 8.h),
                  //instructor name
                  Row(
                    children: [
                      AnyImageView(
                        imagePath:
                            "https://res.cloudinary.com/dm1xze4ej/image/upload/v1708804863/avatars/ye6r7r8kqv6r4j6qcm5g.jpg",
                        width: 30.w,
                        height: 30.h,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Gap(10.h),

                  //other video sections
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.play_circle_outline),
                          title: Text(
                            "JavaScript Basics Part ${index + 1}",
                            style: TextStyle(fontSize: 13.sp),
                          ),
                          trailing: Text(
                            "10:00",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
