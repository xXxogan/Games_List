import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_details_response.g.dart';

@JsonSerializable()
class GameDetailsResponse extends Equatable {
  const GameDetailsResponse({
    required this.id,
    required this.name,
    this.bgImage,
  });

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$GameDetailsResponseFromJson(json);

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "background_image")
  final String? bgImage;

  Map<String, dynamic> toJson() => _$GameDetailsResponseToJson(this);

  @override
  List<Object?> get props => [id, name, bgImage];
}
