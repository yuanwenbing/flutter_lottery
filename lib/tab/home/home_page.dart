import 'package:flutter/material.dart';
import 'package:flutter_lottery/model/home_entity.dart';
import 'package:flutter_lottery/ui/banner.dart';
import 'package:yc_flutter_plugin/yc_flutter_plugin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController;
  LoadingState _loadingState;
  home_entity _homeEntity;
  List<Widget> _items = List();

  _requestHomeData() {
    var url = "https://www.fastmock.site/mock/4661639e913bdad93794755a39d36af4/flutter/index";
    NetUtils.instance().request(url, (response) {
      _homeEntity = home_entity.fromJson(response);
      setState(() {
        _refreshController.refreshCompleted();
        _loadingState = LoadingState.SUCCESS;
        _itemBanner();
        _itemShuangseqiu();
        _itemDaletou();
      });
    }, method: NetUtils.POST);
  }

  @override
  void initState() {
    _loadingState = LoadingState.START;
    _refreshController = RefreshController();
    _requestHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
      ),
      body: YCLoading(
        child: YCRefresh(
          child: ListView(
            children: _items,
          ),
          controller: _refreshController,
          onRefresh: () async {
//            Future.delayed(Duration(seconds: 2), () {
//              _refreshController.refreshCompleted();
//            });
            _requestHomeData();
          },
          enableLoadMore: false,
        ),
        state: _loadingState,
      ),
    );
  }

  _itemBanner() {
    _items.add(SizedBox(height: 200, child: BannerPage(urls: _homeEntity?.data?.banner)));
  }

  _itemShuangseqiu() {
    _items.add(Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 8),
          child: Text(
            "双色球 20190914期",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 28),
            ),
            _ball(2, false),
            _ball(3, false),
            _ball(12, false),
            _ball(16, false),
            _ball(29, false),
            _ball(31, false),
            _ball(13, true, divider: true),
            Padding(
              padding: EdgeInsets.only(right: 28),
            ),
          ],
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ));
  }

  _itemDaletou() {
    _items.add(Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 8),
          child: Text(
            "大乐透 20190914期",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 28),
            ),
            _ball(3, false),
            _ball(5, false),
            _ball(11, false),
            _ball(19, false),
            _ball(30, false),
            _ball(7, true, divider: true),
            _ball(13, true),
            Padding(
              padding: EdgeInsets.only(right: 28),
            ),
          ],
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    ));
  }

  _ball(int num, bool primary, {bool divider = false}) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(left: primary ? 15 : 0),
          width: 30,
          height: 30,
          decoration:
              BoxDecoration(shape: BoxShape.circle, border: Border.all(color: primary ? Colors.red : Colors.blue)),
          child: Center(
            child: Text(num.toString()),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
