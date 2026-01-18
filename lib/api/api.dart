import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' hide Parser;
import 'package:games_list/api/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "")
abstract class GamesApiClient {
  factory GamesApiClient(Dio dio, {String? baseUrl}) = _GamesApiClient;

  factory GamesApiClient.create({String? apiUrl}) {
    final apiKey = dotenv.env["API_ACCESS_KEY"];
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final queryParams = Map<String, dynamic>.from(
            options.queryParameters,
          );
          queryParams.putIfAbsent("key", () => apiKey);
          options.queryParameters = queryParams;
          return handler.next(options);
        },
      ),
    );

    if (apiUrl != null) {
      return GamesApiClient(dio, baseUrl: apiUrl);
    }
    return GamesApiClient(dio);
  }

  @GET("/games")
  Future<GamesListResponse> getGamesList({
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("search") String? search,
  });

  @GET("/games/{id}")
  Future<GameDetailsResponse> getGameById(@Path("id") int id);
}
