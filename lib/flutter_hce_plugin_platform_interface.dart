import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_hce_plugin_method_channel.dart';

abstract class FlutterHcePluginPlatform extends PlatformInterface {
  /// Constructs a FlutterHcePluginPlatform.
  FlutterHcePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterHcePluginPlatform _instance = MethodChannelFlutterHcePlugin();

  /// The default instance of [FlutterHcePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterHcePlugin].
  static FlutterHcePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterHcePluginPlatform] when
  /// they register themselves.
  static set instance(FlutterHcePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<NFCState?> isNFCSupported() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> sendResponse(String response) {
    throw UnimplementedError('sendResponse() has not been implemented.');
  }
}

enum NFCState {
  supported,
  notSupported,
  notAvailable,
}
