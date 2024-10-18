import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tflite_plugin_platform_interface.dart';

/// An implementation of [TflitePluginPlatform] that uses method channels.
class MethodChannelTflitePlugin extends TflitePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tflite_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
