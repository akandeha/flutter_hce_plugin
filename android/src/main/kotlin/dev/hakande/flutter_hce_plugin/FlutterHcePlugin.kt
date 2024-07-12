package dev.hakande.flutter_hce_plugin


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

/** FlutterHcePlugin */
class FlutterHcePlugin: FlutterPlugin {
  private lateinit var methodChannel : MethodChannel
  private lateinit var service: FlutterHceService

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_hce_plugin")
    service = FlutterHceService(flutterPluginBinding.applicationContext)
    val methodChannelHandler = FlutterHceMethodChannelHandler(service)
    methodChannel.setMethodCallHandler(methodChannelHandler)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
  }
}
