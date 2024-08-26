// package com.example.tflite_plugin_example;

// import io.flutter.embedding.android.FlutterActivity;
// import io.flutter.embedding.engine.FlutterEngine;
// import androidx.annotation.NonNull;
// import android.graphics.Bitmap;
// import android.graphics.BitmapFactory;
// import java.io.IOException;
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;
// import android.widget.Toast;

// public class MainActivity extends FlutterActivity {
//     private static final String CHANNEL = "tflite_plugin";
//     private Detector detector;

//     @Override
//     public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//         super.configureFlutterEngine(flutterEngine);
//         try {
//             detector = TFLiteObjectDetectionAPIModel.create(getApplicationContext(), "detect.tflite", "labelmap.txt", 320, false);
//         } catch (IOException e) {
//             e.printStackTrace();
//             // Có thể thông báo lỗi hoặc xử lý ngoại lệ theo cách bạn muốn
//             Toast.makeText(getApplicationContext(), "Error loading model: " + e.getMessage(), Toast.LENGTH_LONG).show();
//         }

//         new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//           .setMethodCallHandler(
//             (call, result) -> {
//               if (call.method.equals("recognizeImage")) {
//                 byte[] imageData = call.argument("imageData");
//                 if (imageData != null) {
//                   Bitmap bitmap = BitmapFactory.decodeByteArray(imageData, 0, imageData.length);
//                   if (bitmap != null) {
//                     if (detector != null) {
//                       try {
//                         List<Detector.Recognition> recognitions = detector.recognizeImage(bitmap);
//                         List<Map<String, Object>> resultList = new ArrayList<>();
//                         for (Detector.Recognition recognition : recognitions) {
//                           Map<String, Object> resultMap = new HashMap<>();
//                           resultMap.put("id", recognition.getId());
//                           resultMap.put("title", recognition.getTitle());
//                           resultMap.put("confidence", recognition.getConfidence());
//                           Map<String, Float> locationMap = new HashMap<>();
//                           locationMap.put("left", recognition.getLocation().left);
//                           locationMap.put("top", recognition.getLocation().top);
//                           locationMap.put("right", recognition.getLocation().right);
//                           locationMap.put("bottom", recognition.getLocation().bottom);
//                           resultMap.put("location", locationMap);
//                           resultList.add(resultMap);
//                         }
//                         result.success(resultList);
//                       } catch (Exception e) {
//                         result.error("DETECTION_ERROR", "Error during detection: " + e.getMessage(), null);
//                       }
//                     } else {
//                       result.error("DETECTOR_NOT_INITIALIZED", "Detector is not initialized", null);
//                     }
//                   } else {
//                     result.error("INVALID_IMAGE", "Bitmap is null", null);
//                   }
//                 } else {
//                   result.error("INVALID_IMAGE_DATA", "Image data is null", null);
//                 }
//               } else {
//                 result.error("INVALID_IMAGE_DATA", "methods data is null", null);
//               }
//             }
//           );
//     }
// }
