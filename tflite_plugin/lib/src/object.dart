import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_plugin/src/tfite_object_detection_api_model.dart';

// Add image package
class ObjectDetectionPage extends StatefulWidget {
  const ObjectDetectionPage({super.key});

  @override
  State<ObjectDetectionPage> createState() => _ObjectDetectionPageState();
}

class _ObjectDetectionPageState extends State<ObjectDetectionPage> {
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;
  List<Recognition>? recognitions;
  final TFLiteObjectDetectionAPIModel _detector =
      TFLiteObjectDetectionAPIModel();

  int _imageHeight = 0;
  int _imageWidth = 0;
  double? _cropX;
  double? _cropY;
  double? _cropW;
  double? _cropH;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _captureAndCropImage();
    set();
  }

  setRecognitions(imageHeight, imageWidth) {
    setState(() {
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  Future<void> _initializeCamera() async {
    await _requestPermissions();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _cameraController?.initialize();
    setState(() {});
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      throw Exception('Camera permission not granted');
    }
  }

  Uint8List convertToUint8List(CameraImage image) {
    // Đây là ví dụ với format YUV420, bạn có thể thay đổi tùy theo format

    // Lấy dữ liệu từ các planes
    final plane0 = image.planes[0];
    final plane1 = image.planes[1];
    final plane2 = image.planes[2];

    // Chuyển đổi các planes sang Uint8List
    Uint8List bytes = Uint8List.fromList(
      List<int>.generate(
          plane0.bytes.length + plane1.bytes.length + plane2.bytes.length, (i) {
        if (i < plane0.bytes.length) return plane0.bytes[i];
        if (i < plane0.bytes.length + plane1.bytes.length) {
          return plane1.bytes[i - plane0.bytes.length];
        }
        return plane2.bytes[i - plane0.bytes.length - plane1.bytes.length];
      }),
    );

    return bytes;
  }

  Future<void> _captureAndCropImage() async {
    try {
      final XFile picture = await _cameraController!.takePicture();

      // Load the image
      final image = img.decodeImage(await picture.readAsBytes());

      if (image == null) return;
      setRecognitions(image.width, image.height);
      // Define crop parameters (center crop example)
      final cropWidth = image.width ~/ 2;
      final cropHeight = image.height ~/ 2;
      final cropX = (image.width - cropWidth) ~/ 2;
      final cropY = (image.height - cropHeight) ~/ 2;

      // Crop the image
      final croppedImage =
          img.copyCrop(image, cropX, cropY, cropWidth, cropHeight);

      // Convert the image to Uint8List
      final Uint8List imageData =
          Uint8List.fromList(img.encodePng(croppedImage));

      setState(() {
        _cropX = cropX.toDouble();
        _cropY = cropY.toDouble();
        _cropW = cropWidth.toDouble();
        _cropH = cropHeight.toDouble();
      });
      // Pass the image data to the model for detection
      await _detectObjects(imageData);
    } catch (e) {
      if (kDebugMode) {
        print("Error capturing and cropping image: $e");
      }
    }
  }

  Future<void> _detectObjects(Uint8List imageData) async {
    final List<Recognition> results = await _detector.recognizeImage(imageData);
    setState(() {
      recognitions = results;
    });
  }

  double getScaleW() {
    final aspectRatioPreview =
        _cameraController!.value.previewSize!.aspectRatio;
    final aspectRatioScreen = MediaQuery.of(context).size.aspectRatio;
    return aspectRatioScreen / aspectRatioPreview;
  }

  double getScaleH() {
    final aspectRatioPreview =
        _cameraController!.value.previewSize!.aspectRatio;
    final aspectRatioScreen = MediaQuery.of(context).size.aspectRatio;
    return aspectRatioPreview / aspectRatioScreen;
  }

  @override
  Widget build(BuildContext context) {
    final test = recognitions;
    Recognition? getMaxConfidenceRecognition(List<Recognition> results) {
      if (results.isEmpty) return null;

      Recognition? maxConfidenceRecognition = results[0];

      for (var recognition in results) {
        if (recognition.confidence > maxConfidenceRecognition!.confidence) {
          maxConfidenceRecognition = recognition;
        }
      }

      return maxConfidenceRecognition;
    }

    final a = getMaxConfidenceRecognition(test ?? []);

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (_cameraController != null)
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Stack(
                      children: [
                        Center(
                          child: Stack(children: [
                            SizedBox(
                                width: 500,
                                child: CameraPreview(_cameraController!)),
                            Positioned(
                              left: (a?.location.left ?? 50),
                              top: (a?.location.top ?? 50),
                              width: (a?.location.width ?? 50),
                              height: (a?.location.height ?? 50),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        // if (_cropX != null &&
                        //     _cropY != null &&
                        //     _cropW != null &&
                        //     _cropH != null)
                        //   (test != null)
                        //       ? BndBox(
                        //           test,
                        //           math.max(_imageHeight, _imageWidth),
                        //           math.min(_imageHeight, _imageWidth),
                        //           400,
                        //           300)
                        //       // CustomPaint(
                        //       //     painter: RecognitionPainter(
                        //       //         getMaxConfidenceRecognition(test)),
                        //       //   )
                        //       : const SizedBox()
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 16,
                ),
                (test != null)
                    ? Text(
                        "Chữ: ${getMaxConfidenceRecognition(test)?.title}",
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void set() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_cameraController != null) {
        _captureAndCropImage();
      }
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}
