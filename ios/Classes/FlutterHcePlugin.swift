import Flutter
import UIKit

public class FlutterHcePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_hce_plugin", binaryMessenger: registrar.messenger())
    let instance = FlutterHcePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  let service = FlutterHceService()
    switch call.method {
    case "isNFCSupported":
      result(service.isNFCSupported())
    case "sendResponse":
       result(service.sendResponse())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
