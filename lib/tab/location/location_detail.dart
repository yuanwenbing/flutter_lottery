import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocationDetailWidget extends StatefulWidget {
  @override
  _LocationDetailWidgetState createState() => _LocationDetailWidgetState();
}

class _LocationDetailWidgetState extends State<LocationDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("详情"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: WebView(
          initialUrl: "http://beijing.bitauto.com/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
