package dev.hakande.flutter_hce_plugin

import android.nfc.cardemulation.HostApduService
import android.os.Bundle

class FlutterHceApduService: HostApduService() {
    override fun processCommandApdu(commandApdu: ByteArray?, extras: Bundle?): ByteArray {
        TODO("Not yet implemented")
    }

    override fun onDeactivated(reason: Int) {
        TODO("Not yet implemented")
    }
}