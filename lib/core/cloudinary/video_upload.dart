import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class VideoUploadPage extends StatefulWidget {
  const VideoUploadPage({super.key});

  @override
  State<VideoUploadPage> createState() => _VideoUploadPageState();
}

class _VideoUploadPageState extends State<VideoUploadPage> {
  File? selectedVideo;
  double uploadProgress = 0.0;
  String? uploadedVideoUrl;
  bool isUploading = false;

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

    const cloudName = "dm1xze4ej";
    const uploadPreset = "udemy_clone_video";

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

      setState(() {
        uploadedVideoUrl = response.data["secure_url"];
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
