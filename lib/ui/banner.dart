import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lottery/ui/indicator.dart';
import 'package:yc_flutter_plugin/yc_flutter_plugin.dart';

void main() => runApp(new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Banner"),
        ),
        body: new BannerPage(
          urls: <String>[
            "http://b.hiphotos.baidu.com/image/h%3D300/sign=92afee66fd36afc3110c39658318eb85/908fa0ec08fa513db777cf78376d55fbb3fbd9b3.jpg",
            "http://a.hiphotos.baidu.com/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
            "http://a.hiphotos.baidu.com/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
            "http://a.hiphotos.baidu.com/image/h%3D300/sign=b38f3fc35b0fd9f9bf175369152cd42b/9a504fc2d5628535bdaac29e9aef76c6a6ef63c2.jpg",
          ],
        ),
      ),
    ));

class BannerPage extends StatefulWidget {
  final List<String> urls;
  final Duration interval;

  const BannerPage({Key key, @required this.urls, this.interval = const Duration(milliseconds: 3000)}) : super(key:
  key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  PageController _pageController;
  int _currentIndex = 0;
  Timer _timer;

  _startAutoScroll() {
    _timer = Timer.periodic(widget.interval, (timer) {
      if (mounted)
        _pageController.animateToPage(_currentIndex++,
            curve: Curves.fastLinearToSlowEaseIn, duration: Duration(milliseconds: 600));
    });
  }

  @override
  void initState() {
    _pageController = new PageController(initialPage: 0);
    _startAutoScroll();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: GestureDetector(
          onTapDown: (details) {
            _timer.cancel();
          },
          onTapUp: (details) {
            _startAutoScroll();
          },
          child: PageIndicator(
            bottomGravity: BottomGravity.right,
            indicatorStyle: IndicatorStyle.rectangle,
            length: 4,
            pageView: PageView.builder(
              onPageChanged: (index) {
                _currentIndex = index;
              },
              itemBuilder: (context, index) {
                return YCImage(
                  holderType: PlaceHolderType.IMAGE_TYPE_LIGHT_BIG,
                  imageUrl: widget.urls[index % widget.urls.length],
                  fit: BoxFit.cover,
                );
              },
              controller: _pageController,
            ),
          )),
    );
  }
}
