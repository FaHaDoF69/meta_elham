import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CustomFileUpload extends StatelessWidget {
  const CustomFileUpload({super.key});

  Future<void> _pickAndUploadFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File selected: ${file.path}')),
      );

      final dio = Dio();
      const String uploadUrl =
          'https://yourserver.com/upload'; // Replace with your server URL

      try {
        FormData formData = FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path,
              filename: result.files.single.name),
        });

        Response response = await dio.post(
          uploadUrl,
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          ),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('File uploaded successfully: ${response.data}')),
          );
          print("File uploaded successfully: ${response.data}");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Failed to upload file: ${response.statusCode}')),
          );
          print("Failed to upload file: ${response.statusCode}");
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error during file upload: $e')),
        );
        print("Error during file upload: $e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
      print("File selection canceled.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'في حالة الإجابة بنعم يرجى إرفاق ملفه أو تقديم التفاصيل',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.upload, color: Colors.grey),
              onPressed: () {
                _pickAndUploadFile(
                    context); // Call the file picker and upload when pressed
              },
            ),
          ),
        ),
      ],
    );
  }
}
