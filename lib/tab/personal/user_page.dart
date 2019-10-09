import 'package:flutter/material.dart';
import 'package:flutter_lottery/tab/personal/user_detail.dart';
import 'package:yc_flutter_plugin/yc_flutter_plugin.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
      ),
      body: UserPageWidget(),
    );
  }
}

class UserPageWidget extends StatefulWidget {
  @override
  _UserPageWidgetState createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> with AutomaticKeepAliveClientMixin {

  bool loginState = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return loginState ? _generateLoginPage() : _generateLogoutPage();
  }

  _changeLoginState(bool state) {
    setState(() {
      loginState = state;
    });
  }

  Widget _generateLoginPage() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.1),
              ),
              _divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (buildContext) => UserDetailWidget()));
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: ClipOval(
                          child: YCImage(
                            width: 80,
                            height: 80,
                            imageUrl:
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569998517&di=048188820113bbf03c1e1eb2f0630040&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.people.com.cn%2Fmediafile%2Fpic%2F20190730%2F67%2F12642585976241005847.jpg",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "李三民",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text("白金会员")
                      ],
                    ),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
              ),
              _divider(),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              _divider(),
              _item("我的订单（203）", () {}),
              _item("消息推送", () {}),
              _item("版本更新（v1.0.0）", () {}),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey[300])),
          child: InkWell(
            onTap: (){
              Toast.show("Logout", context);
              setState(() {
                _changeLoginState(false);
              });
            },
            child: Container(
              padding: EdgeInsets.all(7),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  "退出登录",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
        )
      ],
    );
  }


  Widget _generateLogoutPage() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 0.1),
              ),
              _divider(),
              InkWell(
                onTap: () {
                  Toast.show("Login", context);
                  setState(() {
                    _changeLoginState(true);
                  });

                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                      child: Text("登录"),
                    )
                  ],
                ),
              ),
              _divider(),
              Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              _divider(),
              _item("我的订单", () {}),
              _item("消息推送", () {}),
              _item("版本更新（v1.0.0）", () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget _item(String title, tap) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
              child: Text(title),
            ),
          ),
          _divider(),
        ],
      ),
      onTap: tap,
    );
  }

  Widget _divider() {
    return Divider(
      color: Colors.grey,
      height: 1,
    );
  }

  @override
  bool get wantKeepAlive => true;
}