import 'package:flutter/material.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:tflite_plugin/tflite_plugin.dart';

class ObjectDetectionScreen extends StatefulWidget {
  const ObjectDetectionScreen({super.key});

  @override
  State<ObjectDetectionScreen> createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: 'Luyện tay',
        onTap: () => Navigator.pop(context),
      ),
      body: SizedBox(height: size.height*0.7, width: 700, child: const ObjectDetectionPage()),
    );
  }
}
