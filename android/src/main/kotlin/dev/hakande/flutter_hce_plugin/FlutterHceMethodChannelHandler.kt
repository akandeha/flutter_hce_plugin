package dev.hakande.flutter_hce_plugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.*

class FlutterHceMethodChannelHandler(private val service: FlutterHceService) : MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "sendResponse" -> result.success(service.sendResponse(call))
            "startHce" -> service.startHceService()
            "checkNfc" -> result.success(service.checkNfc())
            else -> result.notImplemented()
        }
    }
}