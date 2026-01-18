// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailsResponse _$GameDetailsResponseFromJson(Map<String, dynamic> json) =>
    GameDetailsResponse(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      bgImage: json['background_image'] as String?,
    );

Map<String, dynamic> _$GameDetailsResponseToJson(
  GameDetailsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'background_image': instance.bgImage,
};
