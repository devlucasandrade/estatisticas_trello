import 'package:dio/dio.dart';
import 'package:estatisticas_trello/src/model/board_model.dart';
import 'package:estatisticas_trello/src/service/api/configuration/api_service.dart';
import 'package:estatisticas_trello/src/service/keys/api_keys.dart';
import 'package:flutter/material.dart';

final dio = ApiService().dio;

const trelloKey = ApiKeys.trelloKey;
const trelloToken = ApiKeys.trelloToken;
const trelloBoard = ApiKeys.trelloBoard;
const keyAndToken = '?key=$trelloKey&token=$trelloToken';

class BoardRepository {
  Future<BoardModel> getBoard() async {
    try {
      final response = await dio.get('boards/$trelloBoard/$keyAndToken');
      return BoardModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar listas');
    }
  }
}
