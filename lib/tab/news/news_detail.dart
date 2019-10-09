import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWidget extends StatefulWidget {
  @override
  _NewsDetailWidgetState createState() => _NewsDetailWidgetState();
}

class _NewsDetailWidgetState extends State<NewsDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text("新闻详情"),
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
