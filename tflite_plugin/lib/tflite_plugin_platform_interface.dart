import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tflite_plugin_method_channel.dart';

abstract class TflitePluginPlatform extends PlatformInterface {
  /// Constructs a TflitePluginPlatform.
  TflitePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TflitePluginPlatform _instance = MethodChannelTflitePlugin();

  /// The default instance of [TflitePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTflitePlugin].
  static TflitePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TflitePluginPlatform] when
  /// they register themselves.
  static set instance(TflitePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
