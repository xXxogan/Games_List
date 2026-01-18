import 'package:equatable/equatable.dart';
import 'package:games_list/api/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'games_list_response.g.dart';

@JsonSerializable()
class GamesListResponse extends Equatable {
  const GamesListResponse({this.next, this.previous, required this.results});

  factory GamesListResponse.fromJson(Map<String, dynamic> json) =>
      _$GamesListResponseFromJson(json);

  @JsonKey(name: "next")
  final String? next;

  @JsonKey(name: "previous")
  final String? previous;

  @JsonKey(name: "results")
  final List<GameShortResponse> results;

  GamesListResponse copyWith({List<GameShortResponse>? results, String? next}) {
    return GamesListResponse(
      results: results ?? this.results,
      next: next ?? this.next,
    );
  }

  Map<String, dynamic> toJson() => _$GamesListResponseToJson(this);

  @override
  List<Object?> get props => [next, previous, results];
}
