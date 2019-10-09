import 'package:flutter/material.dart';

enum BottomGravity {
  left,
  center,
  right,
}

enum IndicatorStyle {
  circle,
  rectangle,
}

class PageIndicator extends StatefulWidget {
  final PageView pageView;

  // 这个参数如果不传，则按pageView的总长度来使用，如果传则按（总长度%length）来使用，主要是处理loop的状态
  final int length;

  final Size size;

  final double initPage;

  final BottomGravity bottomGravity;

  final IndicatorStyle indicatorStyle;

  final double paddingBottom;

  final double indicatorSpace;

  final Color normalColor;

  final Color selectedColor;

  const PageIndicator(
      {Key key,
      @required this.pageView,
      @required this.length,
      this.bottomGravity = BottomGravity.right,
      this.indicatorStyle = IndicatorStyle.circle,
      this.paddingBottom = 10,
      this.indicatorSpace = 8,
      this.size = const Size(8, 8),
      this.normalColor = Colors.grey,
      this.selectedColor = Colors.red,
      this.initPage = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator> {
  double currentPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          child: widget.pageView,
          onNotification: _onNotification,
        ),
        _generateIndicatorLayout(widget.length)
      ],
    );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final PageMetrics metrics = notification.metrics;
      setState(() {
        currentPage = metrics.page;
      });
      return true;
    }

    return false;
  }

  Widget _generateIndicatorLayout(int length) {
    if (widget.bottomGravity == BottomGravity.right) {
      return Positioned(
        child: Row(
          children: _generateIndicator(length),
        ),
        right: widget.paddingBottom,
        bottom: widget.paddingBottom,
      );
    } else if (widget.bottomGravity == BottomGravity.center) {
      return Positioned(
        child: Row(
          children: _generateIndicator(length),
        ),
        bottom: widget.paddingBottom,
      );
    } else {
      return Positioned(
        child: Row(
          children: _generateIndicator(length),
        ),
        left: widget.paddingBottom,
        bottom: widget.paddingBottom,
      );
    }
  }

  List<Widget> _generateIndicator(int length) {
    List<Widget> indicators = List();
    int actualPosition = (currentPage ?? widget.initPage).round() % widget.length;
    for (int i = 0; i < length; i++) {
      indicators.add(Container(
        width: widget.size.width,
        height: widget.size.height,
        margin: EdgeInsets.only(left: widget.indicatorSpace),
        decoration: BoxDecoration(
            color: actualPosition == i ? widget.selectedColor : widget.normalColor,
            shape: widget.indicatorStyle == IndicatorStyle.circle ? BoxShape.circle : BoxShape.rectangle),
      ));
    }
    return indicators;
  }
}
