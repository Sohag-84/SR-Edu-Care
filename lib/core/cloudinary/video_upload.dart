import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:sr_edu_care/core/constants/export.dart';

class VideoUploadPage extends StatefulWidget {
  final String lectureId;
  const VideoUploadPage({super.key, required this.lectureId});

  @override
  State<VideoUploadPage> createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  File? selectedVideo;
  double uploadProgress = 0.0;
  String? uploadedVideoUrl;
  String? publicId;
  bool isUploading = false;

  var isToggoleSwitch = false;

  final Dio dio = Dio();

  /// Pick video
  Future<void> pickVideo() async {
    final picker = ImagePicker();
    final video = await picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        selectedVideo = File(video.path);
        uploadedVideoUrl = null;
      });
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
      appBar: AppBar(title: const Text("Cloudinary Video Upload")),
      body: Padding(
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
                "Selected: ${selectedVideo!.path.split('/').last}",
                style: const TextStyle(fontSize: 14),
              ),

            const SizedBox(height: 20),

            //switch for video preview value
            Row(
              children: [
                Text("Video Preview"),
                Gap(10.w),
                Switch(
                  value: isToggoleSwitch,
                  onChanged: (value) {
                    setState(() {
                      isToggoleSwitch = value;
                    });
                  },
                ),
              ],
            ),

            //upload video in cloudinary
            ElevatedButton(
              onPressed: isUploading ? null : uploadVideo,
              child: const Text("Upload Video"),
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

            const SizedBox(height: 20),

            if (uploadedVideoUrl != null)
              SelectableText(
                "Uploaded URL:\n$uploadedVideoUrl",
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
