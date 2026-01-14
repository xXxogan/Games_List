import 'package:games_list/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'games_response.g.dart';

@JsonSerializable()
class GamesResponse {
  const GamesResponse({this.next, this.previous, required this.results});

  factory GamesResponse.fromJson(Map<String, dynamic> json) =>
      _$GamesResponseFromJson(json);

  @JsonKey(name: "next")
  final String? next;

  @JsonKey(name: "previous")
  final String? previous;

  @JsonKey(name: "results")
  final List<Game> results;

  GamesResponse copyWith({List<Game>? results, String? next}) {
    return GamesResponse(
      results: results ?? this.results,
      next: next ?? this.next,
    );
  }

  Map<String, dynamic> toJson() => _$GamesResponseToJson(this);
}
