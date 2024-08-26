// package com.example.tflite_plugin_example;

// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;
// import android.content.Context;
// import android.graphics.Bitmap;
// import android.graphics.BitmapFactory;

// import java.io.IOException;
// import java.util.ArrayList;
// import java.util.HashMap;
// import java.util.List;
// import java.util.Map;

// import androidx.annotation.NonNull;

// import io.flutter.embedding.engine.plugins.FlutterPlugin;
// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
// import io.flutter.plugin.common.MethodChannel.Result;

// import com.example.tflite_plugin_example.Detector;

// /** TflitePlugin */
// public class TflitePlugin implements FlutterPlugin, MethodCallHandler {
//   /// The MethodChannel that will the communication between Flutter and native Android
//   ///
//   /// This local reference serves to register the plugin with the Flutter Engine and unregister it
//   /// when the Flutter Engine is detached from the Activity
//   private MethodChannel channel;
//   private Detector detector;
//   @Override
//   public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
//     channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "tflite_plugin");
//     Context context = flutterPluginBinding.getApplicationContext();
//     try {
//       detector = TFLiteObjectDetectionAPIModel.create(context, "mobilenet.tflite", "labels.txt", 29, true);
//     } catch (IOException e) {
//       e.printStackTrace();
//       // Có thể thông báo lỗi hoặc xử lý ngoại lệ theo cách bạn muốn
//     }
//     channel.setMethodCallHandler(this);
//   }

//   @Override
//   public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
//     if (call.method.equals("getPlatformVersion")) {
//       result.success("Android " + android.os.Build.VERSION.RELEASE);
//     }
//      else if(call.method.equals("recognizeImage")){
//                 byte[] imageData = call.argument("imageData");
//         Bitmap bitmap = BitmapFactory.decodeByteArray(imageData, 0, imageData.length);
//         List<Detector.Recognition> recognitions = detector.recognizeImage(bitmap);
//         List<Map<String, Object>> resultList = new ArrayList<>();
//         for (Detector.Recognition recognition : recognitions) {
//           Map<String, Object> resultMap = new HashMap<>();
//           resultMap.put("id", recognition.getId());
//           resultMap.put("title", recognition.getTitle());
//           resultMap.put("confidence", recognition.getConfidence());
//           Map<String, Float> locationMap = new HashMap<>();
//           locationMap.put("left", recognition.getLocation().left);
//           locationMap.put("top", recognition.getLocation().top);
//           locationMap.put("right", recognition.getLocation().right);
//           locationMap.put("bottom", recognition.getLocation().bottom);
//           resultMap.put("location", locationMap);
//           resultList.add(resultMap);
//         }
//         result.success(resultList);
//      }
//     else {
//       result.notImplemented();
//     }
//   }

//   @Override
//   public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
//     channel.setMethodCallHandler(null);
//   }
// }
