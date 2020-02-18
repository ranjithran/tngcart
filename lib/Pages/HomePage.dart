import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        geolocationEnabled: true,
        appCacheEnabled: true,
        enableAppScheme: true,
        scrollBar: true,
        url: "https://tngcart.com/",
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
