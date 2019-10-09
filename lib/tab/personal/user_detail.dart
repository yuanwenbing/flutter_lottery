import 'package:flutter/material.dart';

class UserDetailWidget extends StatefulWidget {
  @override
  _UserDetailWidgetState createState() => _UserDetailWidgetState();
}

class _UserDetailWidgetState extends State<UserDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("个人信息"),
          centerTitle: true,
          leading: new GestureDetector(
            child: BackButtonIcon(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: new Container(),
      ),
    );
  }
}
