import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_short_response.g.dart';

@JsonSerializable()
final class GameShortResponse extends Equatable {
  const GameShortResponse({required this.id, required this.name, this.bgImage});

  factory GameShortResponse.fromJson(Map<String, dynamic> json) =>
      _$GameShortResponseFromJson(json);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "background_image")
  final String? bgImage;

  Map<String, dynamic> toJson() => _$GameShortResponseToJson(this);

  @override
  List<Object?> get props => [id, name, bgImage];
}
