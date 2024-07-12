package dev.hakande.flutter_hce_plugin

import android.content.Context
import android.content.Intent
import android.nfc.NfcManager
import io.flutter.plugin.common.MethodCall

class FlutterHceService(private val context: Context) {

    fun checkNfc(): Boolean {
        val nfcManager = context.getSystemService(Context.NFC_SERVICE) as NfcManager;
        val nfcAdapter = nfcManager.defaultAdapter;
        return nfcAdapter?.isEnabled ?: false
    }

    fun startHceService() {
        val intent = Intent(context, FlutterHceApduService::class.java)
        context.startService(intent)
    }

    fun stopHceService() {
        val intent = Intent(context, FlutterHceApduService::class.java)
        context.stopService(intent)
    }

    fun sendResponse(call: MethodCall) {

    }
}