import 'package:flutter/material.dart';
import 'package:flutter_lottery/model/news_entity.dart';
import 'package:flutter_lottery/tab/news/news_detail.dart';
import 'package:yc_flutter_plugin/yc_flutter_plugin.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  RefreshController _controller;
  news_entity _newsEntity;
  List<Widget> widgets = List();
  LoadingState _mState;

  _requestNews(refresh) {
    if (refresh) widgets.clear();
    var url = "http://tt.ylapi.cn/toutiao/search.u?uid=11113&appkey=edab3c5355466ffc2b3f54cfce46b528&type=0";
//    Map<String, String> params = new Map();
//    params["uid"] = "11113";
//    params["appkey"] = "edab3c5355466ffc2b3f54cfce46b528";
//    params["type"] = "0";

    NetUtils.instance().request(
        url,
        (response) {
          _newsEntity = news_entity.fromJson(response);
          List<Datas> list = _newsEntity?.datas;
          if (list != null) {
            setState(() {
              _mState = LoadingState.SUCCESS;
//              Toast.show("Success", context, gravity: Gravity.BOTTOM);
              if (refresh) {
                _controller.resetNoData();
              }
              _controller.refreshCompleted();
              _controller.loadComplete();

              list.first.date = "1";

              list.forEach((data) {
                widgets.add(_generateItem(data));
              });
            });
          }
        },
        method: NetUtils.GET,
        errorCallBack: (errorMsg) {
          setState(() {
            _mState = LoadingState.FAILURE;
          });
        });
  }

  Widget _generateItem(Datas data) {
    if (data.thumbnailPicS.isNotEmpty) {
      return _generateItemImageText(data);
    } else {
      return _generateItemPureText(data);
    }
  }

  @override
  void initState() {
    _controller = RefreshController();
    _mState = LoadingState.START;
    _requestNews(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻"),
        centerTitle: true,
      ),
      body: YCLoading(
        child: YCRefresh(
            controller: _controller,
            enableRefresh: true,
            enableLoadMore: true,
            onRefresh: () async {
              _requestNews(true);
            },
            onLoading: () async {
              _requestNews(false);
            },
            child: ListView.separated(
                itemBuilder: _itemBuilder, separatorBuilder: _separatorBuilder, itemCount: widgets.length)),
        state: _mState,
        retry: () {
          setState(() {
            _mState = LoadingState.START;
          });
          _requestNews(true);
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return widgets[index];
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider(
      height: 1,
      color: Colors.grey[300],
    );
  }

  List<Widget> _generateTag(Datas data) {
    List<Widget> tagWidgets = new List();
    if (data.date == "1") {
      tagWidgets.add(Container(
        child: Text(
          "置顶",
          style: TextStyle(color: Colors.red),
        ),
      ));
    }

    tagWidgets.add(Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(data.category),
    ));

    return tagWidgets;
  }

  Widget _generateItemPureText(Datas data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (buildContext) => NewsDetailWidget()));
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              Text(
                data.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _generateTag(data),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _generateItemImageText(Datas data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (buildContext) => NewsDetailWidget()));
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Row(
            children: <Widget>[
              YCImage(
                holderType: PlaceHolderType.IMAGE_TYPE_LIGHT_NORMAL,
                width: 80,
                height: 80,
                imageUrl: data.thumbnailPicS,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: _generateTag(data),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
