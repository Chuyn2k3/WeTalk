// import 'package:flutter_test/flutter_test.dart';
// import 'package:tflite_plugin/tflite_plugin.dart';
// import 'package:tflite_plugin/tflite_plugin_platform_interface.dart';
// import 'package:tflite_plugin/tflite_plugin_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockTflitePluginPlatform
//     with MockPlatformInterfaceMixin
//     implements TflitePluginPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final TflitePluginPlatform initialPlatform = TflitePluginPlatform.instance;

//   test('$MethodChannelTflitePlugin is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelTflitePlugin>());
//   });

//   test('getPlatformVersion', () async {
//     TflitePlugin tflitePlugin = TflitePlugin();
//     MockTflitePluginPlatform fakePlatform = MockTflitePluginPlatform();
//     TflitePluginPlatform.instance = fakePlatform;

//     expect(await tflitePlugin.getPlatformVersion(), '42');
//   });
// }
