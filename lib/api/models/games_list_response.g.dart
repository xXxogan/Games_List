// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamesListResponse _$GamesListResponseFromJson(Map<String, dynamic> json) =>
    GamesListResponse(
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => GameShortResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GamesListResponseToJson(GamesListResponse instance) =>
    <String, dynamic>{
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
