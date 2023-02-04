import 'package:dio/dio.dart';
import 'package:estatisticas_trello/src/model/card_model.dart';
import 'package:estatisticas_trello/src/service/api/configuration/api_service.dart';
import 'package:estatisticas_trello/src/service/keys/api_keys.dart';
import 'package:flutter/material.dart';

final dio = ApiService().dio;

const trelloKey = ApiKeys.trelloKey;
const trelloToken = ApiKeys.trelloToken;
const trelloBoard = ApiKeys.trelloBoard;
const keyAndToken = '?key=$trelloKey&token=$trelloToken';

class CardRepository {
  Future<List<CardModel>> getCardsOnBoard() async {
    try {
      final response = await dio.get('boards/$trelloBoard/cards/$keyAndToken');
      final body = response.data as List;
      return body.map((json) => CardModel.fromJson(json)).toList();
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar');
    }
  }

  Future<List<CardModel>> getCardsOnList(String? listId) async {
    try {
      final response = await dio.get('lists/$listId/cards$keyAndToken');
      final body = response.data as List;
      return body.map((json) => CardModel.fromJson(json)).toList();
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar');
    }
  }

  Future<CardModel> getCard(String? cardId) async {
    try {
      final response = await dio.get('cards/$cardId$keyAndToken');
      return CardModel.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Falha ao buscar');
    }
  }
}
