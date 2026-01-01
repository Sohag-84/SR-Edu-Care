import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sr_edu_care/core/constants/export.dart';
import 'package:sr_edu_care/core/utils/utils.dart';
import 'package:sr_edu_care/feature/course/presentation/bloc/update_lecture/update_lecture_bloc.dart';

class VideoUploadPage extends StatefulWidget {
  final String lectureId;
  final String videoTitle;
  final bool isPreview;
  final String videoUrl;

  const VideoUploadPage({
    super.key,
    required this.lectureId,
    required this.videoTitle,
    required this.isPreview,
    required this.videoUrl,
  });

  @override
  State<VideoUploadPage> createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  File? selectedVideo;
  double uploadProgress = 0.0;
  late String uploadedVideoUrl;
  String? publicId;
  bool isUploading = false;

  late bool isPreview;
  late TextEditingController titleController;

  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.videoTitle);
    uploadedVideoUrl = widget.videoUrl;
    isPreview = widget.isPreview;
  }

  /// Pick video
  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        selectedVideo = File(video.path);
        uploadedVideoUrl = "";
      });
    }
  }

  Future<void> updateCourse() async {
    if (selectedVideo == null && uploadedVideoUrl.isNotEmpty) {
      context.read<UpdateLectureBloc>().add(
        UpdatedLecture(
          lectureId: widget.lectureId,
          videoTitle: titleController.text,
          isPreview: isPreview,
          videoUrl: uploadedVideoUrl,
        ),
      );
    } else {
      await uploadVideo();
    }
  }

  /// Upload video to Cloudinary
  Future<void> uploadVideo() async {
    if (selectedVideo == null) return;

    setState(() {
      isUploading = true;
      uploadProgress = 0;
    });

    String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME']!;
    String uploadPreset = dotenv.env['CLOUDINARY_UPLOAD_PRESET']!;

    final url = "https://api.cloudinary.com/v1_1/$cloudName/video/upload";

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        selectedVideo!.path,
        filename: selectedVideo!.path.split('/').last,
      ),
      "upload_preset": uploadPreset,
    });

    try {
      final response = await dio.post(
        url,
        data: formData,
        onSendProgress: (sent, total) {
          setState(() {
            uploadProgress = sent / total;
          });
        },
      );
      print("Upload Response: ${response.data}");

      setState(() {
        uploadedVideoUrl = response.data["secure_url"];
        publicId = response.data["public_id"];
        isUploading = false;
      });

      context.read<UpdateLectureBloc>().add(
        UpdatedLecture(
          lectureId: widget.lectureId,
          videoTitle: titleController.text,
          isPreview: isPreview,
          videoUrl: uploadedVideoUrl,
        ),
      );
    } catch (e) {
      setState(() {
        isUploading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Upload failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Lecture")),
      body: BlocConsumer<UpdateLectureBloc, UpdateLectureState>(
        listener: (context, state) {
          if (state is UpdateLectureLoading) {
            eassyLoading();
          } else {
            EasyLoading.dismiss();
          }
          if (state is UpdateLectureFailure) {
            Fluttertoast.showToast(msg: state.error);
          } else if (state is UpdateLectureSuccess) {
            Fluttertoast.showToast(msg: state.response.message);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: pickVideo,
                  icon: const Icon(Icons.video_library),
                  label: const Text("Pick Video"),
                ),

                const SizedBox(height: 16),

                if (selectedVideo != null)
                  Text(
                    "Selected Video: ${selectedVideo!.path.split('/').last}",
                    style: const TextStyle(fontSize: 14),
                  ),

                const SizedBox(height: 20),

                Text("Video Title"),
                Gap(5.h),
                TextField(
                  decoration: InputDecoration(
                    filled: false,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  controller: titleController,
                ),
                Gap(10.h),

                //switch for video preview value
                Row(
                  children: [
                    Text("Video Preview"),
                    Gap(10.w),
                    Switch(
                      value: isPreview,
                      onChanged: (value) {
                        setState(() {
                          isPreview = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                if (uploadedVideoUrl.isNotEmpty)
                  SelectableText(
                    "Uploaded URL:\n$uploadedVideoUrl",
                    style: const TextStyle(color: Colors.green),
                  ),
                Gap(20.h),

                //upload video in cloudinary
                ElevatedButton(
                  onPressed: isUploading ? null : updateCourse,
                  child: const Text("Update Lecture"),
                ),

                const SizedBox(height: 20),

                if (isUploading)
                  Column(
                    children: [
                      LinearProgressIndicator(value: uploadProgress),
                      const SizedBox(height: 8),
                      Text("${(uploadProgress * 100).toStringAsFixed(0)}%"),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
