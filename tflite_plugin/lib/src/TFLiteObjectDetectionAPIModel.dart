import 'package:flutter/services.dart';

class Recognition {
  final String id;
  final String title;
  final double confidence;
  final Rect location;

  Recognition({
    required this.id,
    required this.title,
    required this.confidence,
    required this.location,
  });

  @override
  String toString() {
    return '[$id] $title (Confidence: ${confidence * 100.0}%) Location: $location';
  }
}

abstract class Detector {
  Future<List<Recognition>> recognizeImage(Uint8List imageData);
  void enableStatLogging(bool debug);
  void close();
  void setNumThreads(int numThreads);
  void setUseNNAPI(bool isChecked);
}

class TFLiteObjectDetectionAPIModel implements Detector {
  static const MethodChannel _channel = MethodChannel("tflite_plugin");

  @override
  Future<List<Recognition>> recognizeImage(Uint8List imageData) async {
    final List<dynamic> recognitions =
        await _channel.invokeMethod("recognizeImage", {"imageData": imageData});
    print(recognitions);
    return recognitions.map((dynamic item) {
      // Chuyển đổi item thành Map<String, dynamic>
      final Map<String, dynamic> recognition = Map<String, dynamic>.from(item);

      // Lấy 'location' từ recognition và ép kiểu thành Map<String, dynamic>
      final Map<String, dynamic> locationMap =
          Map<String, dynamic>.from(recognition['location'] ?? {});

      // Chuyển đổi locationMap thành Rect
      final Rect location = Rect.fromLTRB(
        (locationMap['left'] as num).toDouble(),
        (locationMap['top'] as num).toDouble(),
        (locationMap['right'] as num).toDouble(),
        (locationMap['bottom'] as num).toDouble(),
      );

      return Recognition(
        id: recognition['id'] ?? 0, // ID thường là kiểu int
        title: recognition['title'] ?? 0,
        confidence: (recognition['confidence'] as num).toDouble(),
        location: location,
      );
    }).toList();
  }

  @override
  void enableStatLogging(bool debug) {
    _channel.invokeMethod('enableStatLogging', {'debug': debug});
  }

  @override
  void close() {
    _channel.invokeMethod('close');
  }

  @override
  void setNumThreads(int numThreads) {
    _channel.invokeMethod('setNumThreads', {'numThreads': numThreads});
  }

  @override
  void setUseNNAPI(bool isChecked) {
    _channel.invokeMethod('setUseNNAPI', {'isChecked': isChecked});
  }
}
