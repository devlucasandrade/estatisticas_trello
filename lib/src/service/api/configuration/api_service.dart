import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.trello.com/1/',
    ),
  );
}
