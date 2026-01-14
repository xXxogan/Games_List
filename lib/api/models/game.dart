import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  const Game({required this.id, required this.name, this.bgImage});

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "background_image")
  final String? bgImage;

  Map<String, dynamic> toJson() => _$GameToJson(this);
}
