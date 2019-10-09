import 'package:flutter/material.dart';
import 'package:flutter_lottery/tab/home/home_page.dart';
import 'package:flutter_lottery/tab/location/locaiton_page.dart';
import 'package:flutter_lottery/tab/personal/user_page.dart';

import 'tab/news/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller;

  initState() {
    _controller = new PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  int currentIndex = 0;

  void _changePage(int index) {
    setState(() {
      currentIndex = index;
      _controller.jumpToPage(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedFontSize: 12.0,
        selectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.red),
            title: Text(
              "首页",
              style: TextStyle(color: currentIndex == 0 ? Colors.red : Colors.grey),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new, color: Colors.grey),
              activeIcon: Icon(
                Icons.fiber_new,
                color: Colors.red,
              ),
              title: Text("新闻", style: TextStyle(color: currentIndex == 1 ? Colors.red : Colors.grey))),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.grey),
            activeIcon: Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            title: Text("投注", style: TextStyle(color: currentIndex == 2 ? Colors.red : Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            activeIcon: Icon(Icons.person, color: Colors.red),
            title: Text("我的", style: TextStyle(color: currentIndex == 3 ? Colors.red : Colors.grey)),
          ),
        ],
      ),
      body: Container(
        child: PageView.builder(
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return HomePage();
              case 1:
                return NewsPage();
              case 2:
                return LocationPage();
              case 3:
                return UserPage();
              default:
                return null;
            }
          },
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: 4,
          controller: _controller,
        ),
      ),
    );
  }
}

class IndexPageWidget extends StatefulWidget {
  @override
  _IndexPageWidgetState createState() => _IndexPageWidgetState();
}

class _IndexPageWidgetState extends State<IndexPageWidget> with AutomaticKeepAliveClientMixin<IndexPageWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("title + $index"),
        );
      },
      itemCount: 40,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
