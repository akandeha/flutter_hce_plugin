
import 'package:flutter_hce_plugin/flutter_hce_plugin_method_channel.dart';

import 'flutter_hce_plugin_platform_interface.dart';

class FlutterHcePlugin {
  Future<NFCState?> isNFCSupported() {
    return FlutterHcePluginPlatform.instance.isNFCSupported();
  }
}


