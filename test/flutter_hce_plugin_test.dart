import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hce_plugin/flutter_hce_plugin.dart';
import 'package:flutter_hce_plugin/flutter_hce_plugin_platform_interface.dart';
import 'package:flutter_hce_plugin/flutter_hce_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterHcePluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterHcePluginPlatform {


  @override
  Future<NFCState?> isNFCSupported() {
    return Future.value(NFCState.supported);
  }

  @override
  Future<void> sendResponse(String response) {
    // TODO: implement sendResponse
    throw UnimplementedError();
  }
}

void main() {
  final FlutterHcePluginPlatform initialPlatform = FlutterHcePluginPlatform.instance;

  test('$MethodChannelFlutterHcePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterHcePlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterHcePlugin flutterHcePlugin = FlutterHcePlugin();
    MockFlutterHcePluginPlatform fakePlatform = MockFlutterHcePluginPlatform();
    FlutterHcePluginPlatform.instance = fakePlatform;

    expect(await flutterHcePlugin.isNFCSupported(), '42');
  });
}
