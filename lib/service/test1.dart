import 'package:flutter/material.dart';
import 'package:tflite_plugin/tflite_plugin.dart';

class ObjectDetectionPage1 extends StatefulWidget {
  const ObjectDetectionPage1({super.key});

  @override
  State<ObjectDetectionPage1> createState() => _ObjectDetectionPage1State();
}

class _ObjectDetectionPage1State extends State<ObjectDetectionPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luyện tay'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 700, width: 700, child: ObjectDetectionPage())
          ],
        ),
      ),
    );
  }
}
