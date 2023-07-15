import 'package:dio/dio.dart';
import 'package:quote_app/data/models/query_parameter.dart';
import 'package:quote_app/domain/repositoties/network_ropistory.dart';

class DioApi implements NetworkRepository {
  late final Dio dio;
  QuerryParameter? parameters;

  DioApi(String url, {this.parameters}) {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      headers: {"X-API-KEY": "4635B4E-5DK4EGG-HTRGGAE-D2TYC1F"},
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }
  @override
  Future<Response> getRandomMovie() {
    try {
      if (parameters == null) {
        return dio.get(
          "/v1.3/movie/random",
        );
      } else {
        return dio.get(
          "/v1.3/movie/random",
          queryParameters: {
            'typeNumber': parameters?.typeNumber,
            'year': parameters?.years,
            'rating.kp': parameters?.rating,
            'persons.name': parameters?.personName,
          },
        );
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
