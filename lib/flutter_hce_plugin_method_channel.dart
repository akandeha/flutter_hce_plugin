import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_hce_plugin_platform_interface.dart';

/// An implementation of [FlutterHcePluginPlatform] that uses method channels.
class MethodChannelFlutterHcePlugin extends FlutterHcePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_hce_plugin');

  @override
  Future<NFCState?> isNFCSupported() async {
    final nfcSupport =
        await methodChannel.invokeMethod<String>('isNFCSupported');
    debugPrint('NFC support response: $nfcSupport');
    switch (nfcSupport) {
      case 'supported':
        return NFCState.supported;
      case 'notSupported':
        return NFCState.notSupported;
      case 'notAvailable':
        return NFCState.notAvailable;
      default:
        return null;
    }
  }

  @override
  Future<void> sendResponse(String response) async {
    await methodChannel.invokeMethod('sendResponse', response);
  }
}
