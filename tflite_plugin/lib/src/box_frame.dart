import 'package:flutter/material.dart';
import 'package:tflite_plugin/src/TFLiteObjectDetectionAPIModel.dart';

class RecognitionPainter extends CustomPainter {
  final Recognition? recognition;

  RecognitionPainter(this.recognition);

  @override
  void paint(Canvas canvas, Size size) {

    if (recognition == null) return;

    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final textPainter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    // Vẽ khung cho đối tượng có confidence lớn nhất
    final rect = recognition!.location;
    canvas.drawRect(rect, paint);

    // Hiển thị thông tin title và confidence
    final title = recognition!.title;
    final confidence = '${(recognition!.confidence * 100.0).toStringAsFixed(2)}%';
    final textSpan = TextSpan(
      text: '$title: $confidence',
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );

    textPainter.text = textSpan;
    textPainter.layout();
    textPainter.paint(canvas, Offset(rect.left, rect.top - textPainter.height));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}