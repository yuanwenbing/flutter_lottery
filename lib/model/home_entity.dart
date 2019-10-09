import 'package:json_annotation/json_annotation.dart';

part 'home_entity.g.dart';


@JsonSerializable()
class home_entity extends Object {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  home_entity(this.status,this.message,this.data,);

  factory home_entity.fromJson(Map<String, dynamic> srcJson) => _$home_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$home_entityToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'banner')
  List<String> banner;

  @JsonKey(name: 'lotteryList')
  List<LotteryList> lotteryList;

  Data(this.banner,this.lotteryList,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class LotteryList extends Object {

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'blueNumber')
  List<int> blueNumber;

  @JsonKey(name: 'redNumber')
  List<int> redNumber;

  LotteryList(this.date,this.type,this.blueNumber,this.redNumber,);

  factory LotteryList.fromJson(Map<String, dynamic> srcJson) => _$LotteryListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LotteryListToJson(this);

}

  
