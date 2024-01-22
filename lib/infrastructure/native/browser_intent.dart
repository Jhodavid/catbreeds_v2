import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';



class BrowserIntent {

  late MethodChannel _channel;

  BrowserIntent() {
    _channel = const MethodChannel('com.catbreeds.johcode');
  }

  void startBrowserIntent(String url) async {
    const method = '/startBrowserIntent';

    try {
      await _channel.invokeMethod(method, url);
    } on PlatformException catch(e) {
      if(kDebugMode) print(e);
    }
  }
}