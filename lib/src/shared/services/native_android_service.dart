import 'package:flutter/services.dart';

class NativeAndroidService {
  static const MethodChannel channel = MethodChannel("nativeAndroid");

  Future<void> makeToast(String text) async {
    await channel.invokeMethod("makeToast", <String, dynamic>{"text": text});
  }
}
