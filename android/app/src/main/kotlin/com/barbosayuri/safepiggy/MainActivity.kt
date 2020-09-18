package com.barbosayuri.safepiggy

import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "nativeAndroid").setMethodCallHandler {
      call, result ->
        when (call.method){
            "makeToast" -> Toast.makeText(this, call.argument<String>("text"), Toast.LENGTH_LONG).show()
      }
    }
  }

}
