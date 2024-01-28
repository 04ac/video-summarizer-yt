import 'package:flutter/services.dart';

class GetSharedDataFromOtherApps {
  static String channel = "app.youtube";

  ///Get the data from Platform channel
  Future<String> sharedData() async {
    final String data = await MethodChannel(channel).invokeMethod("getData");

    return data;
  }
}
