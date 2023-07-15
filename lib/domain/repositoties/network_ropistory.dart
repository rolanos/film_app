import 'package:dio/dio.dart';
import 'package:quote_app/data/models/query_parameter.dart';

abstract class NetworkRepository {
  Future<Response> getRandomMovie();
}
