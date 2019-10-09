import 'package:json_annotation/json_annotation.dart'; 
  
part 'news_entity.g.dart';


@JsonSerializable()
  class news_entity extends Object {

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  news_entity(this.msg,this.code,this.datas,);

  factory news_entity.fromJson(Map<String, dynamic> srcJson) => _$news_entityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$news_entityToJson(this);

}

  
@JsonSerializable()
  class Datas extends Object {

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'author_name')
  String authorName;

  @JsonKey(name: 'thumbnail_pic_s')
  String thumbnailPicS;

  @JsonKey(name: 'uniquekey')
  String uniquekey;

  @JsonKey(name: 'thumbnail_pic_s03')
  String thumbnailPicS03;

  @JsonKey(name: 'thumbnail_pic_s02')
  String thumbnailPicS02;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'url')
  String url;

  Datas(this.date,this.authorName,this.thumbnailPicS,this.uniquekey,this.thumbnailPicS03,this.thumbnailPicS02,this.title,this.category,this.url,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}

  
