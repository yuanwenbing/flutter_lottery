// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

home_entity _$home_entityFromJson(Map<String, dynamic> json) {
  return home_entity(
      json['status'] as int,
      json['message'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$home_entityToJson(home_entity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['banner'] as List)?.map((e) => e as String)?.toList(),
      (json['lotteryList'] as List)
          ?.map((e) => e == null
              ? null
              : LotteryList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'banner': instance.banner,
      'lotteryList': instance.lotteryList
    };

LotteryList _$LotteryListFromJson(Map<String, dynamic> json) {
  return LotteryList(
      json['date'] as String,
      json['type'] as String,
      (json['blueNumber'] as List)?.map((e) => e as int)?.toList(),
      (json['redNumber'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$LotteryListToJson(LotteryList instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': instance.type,
      'blueNumber': instance.blueNumber,
      'redNumber': instance.redNumber
    };
