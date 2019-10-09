// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

news_entity _$news_entityFromJson(Map<String, dynamic> json) {
  return news_entity(
      json['msg'] as String,
      json['code'] as String,
      (json['datas'] as List)
          ?.map((e) =>
              e == null ? null : Datas.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$news_entityToJson(news_entity instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'datas': instance.datas
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
      json['date'] as String,
      json['author_name'] as String,
      json['thumbnail_pic_s'] as String,
      json['uniquekey'] as String,
      json['thumbnail_pic_s03'] as String,
      json['thumbnail_pic_s02'] as String,
      json['title'] as String,
      json['category'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'date': instance.date,
      'author_name': instance.authorName,
      'thumbnail_pic_s': instance.thumbnailPicS,
      'uniquekey': instance.uniquekey,
      'thumbnail_pic_s03': instance.thumbnailPicS03,
      'thumbnail_pic_s02': instance.thumbnailPicS02,
      'title': instance.title,
      'category': instance.category,
      'url': instance.url
    };
