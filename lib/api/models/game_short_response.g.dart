// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_short_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameShortResponse _$GameShortResponseFromJson(Map<String, dynamic> json) =>
    GameShortResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      bgImage: json['background_image'] as String?,
    );

Map<String, dynamic> _$GameShortResponseToJson(GameShortResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'background_image': instance.bgImage,
    };
