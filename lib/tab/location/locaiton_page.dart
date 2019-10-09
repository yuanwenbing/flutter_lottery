import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投注"),
        centerTitle: true,
      ),
      body: LocationPageWidget(),
    );
  }
}

class LocationPageWidget extends StatefulWidget {
  @override
  _LocationPageWidgetState createState() => _LocationPageWidgetState();
}

class _LocationPageWidgetState extends State<LocationPageWidget> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(itemBuilder: _itemBuilder, separatorBuilder: _separatorBuilder, itemCount: 30);
  }

  Widget _itemBuilder(context, index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "腾达大厦店",
                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                    RatingBarIndicator(
                      rating: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                ),
                Row(
                  children: <Widget>[
                    Text("双色球"),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Text("大乐透"),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Text("3D"),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 20,
              ),
              Text("335m")
            ],
          )
        ],
      ),
    );
  }

  Widget _separatorBuilder(context, index) {
    return Divider(
      height: 1,
      color: Colors.grey[300],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
