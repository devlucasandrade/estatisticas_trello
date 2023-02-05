import 'package:estatisticas_trello/src/model/board_model.dart';
import 'package:estatisticas_trello/src/model/labels_model.dart';
import 'package:estatisticas_trello/src/model/list_model.dart';
import 'package:estatisticas_trello/src/service/api/repositories/board_repository.dart';
import 'package:estatisticas_trello/src/service/api/repositories/card_repository.dart';
import 'package:estatisticas_trello/src/service/api/repositories/labes_repository.dart';
import 'package:estatisticas_trello/src/service/api/repositories/list_repository.dart';

class HomeBloc {
  final cardRepository = CardRepository();
  final listRepository = ListRepository();
  final boardRepository = BoardRepository();
  final labelsRepository = LabelsRepository();

  Future<BoardModel> getBoardName() async {
    return await Future<BoardModel>.value(boardRepository.getBoard());
  }

  Future<List<ListModel>> getLists() async {
    final listsOnBoard = await listRepository.getListsOnBoard();
    return listsOnBoard;
  }

  Future<List<LabelsModel>> getLabelsList() async {
    final labels = await labelsRepository.getLabelsOnBoard();
    return labels;
  }

  Future<LabelsInt> getTotalLabels() async {
    final response = await cardRepository.getCardsOnBoard();
    int impressa = 0;
    int digital = 0;
    int televisao = 0;
    int radio = 0;
    int espontanea = 0;
    int respostaImprenssa = 0;
    int artigo = 0;
    int positiva = 0;
    int neutra = 0;
    int negativa = 0;

    for (int i = 0; i < response.length; i++) {
      final card = await cardRepository.getCard(response[i].id);
      for (int i = 0; i < card.labels!.length; i++) {
        //Tipo de Veículo
        if (card.labels?[i].id == '63d32a592f36f2348afdde93') {
          impressa += 1;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9a') {
          digital += 1;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9d') {
          televisao += 1;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9f') {
          radio += 1;
        }

        // Tipo de Mídia
        if (card.labels?[i].id == '63d32a592f36f2348afdde9c') {
          espontanea += 1;
        }
        if (card.labels?[i].id == '63d8281406cd8985df9d9dc8') {
          respostaImprenssa += 1;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9e') {
          artigo += 1;
        }

        // Classificação
        if (card.labels?[i].id == '63d8088af08b6afb46eb7cea') {
          positiva += 1;
        }
        if (card.labels?[i].id == '63d80895ddced7edfd4e3d99') {
          neutra += 1;
        }
        if (card.labels?[i].id == '63d80890851304be2d6e70b4') {
          negativa += 1;
        }
      }
    }
    return LabelsInt(
      impressa: impressa,
      digital: digital,
      televisao: televisao,
      radio: radio,
      espontanea: espontanea,
      respostaImprenssa: respostaImprenssa,
      artigo: artigo,
      positiva: positiva,
      neutra: neutra,
      negativa: negativa,
    );
  }
}

class LabelsInt {
  int impressa;
  int digital;
  int televisao;
  int radio;
  int espontanea;
  int respostaImprenssa;
  int artigo;
  int positiva;
  int neutra;
  int negativa;

  LabelsInt({
    required this.impressa,
    required this.digital,
    required this.televisao,
    required this.radio,
    required this.espontanea,
    required this.respostaImprenssa,
    required this.artigo,
    required this.positiva,
    required this.neutra,
    required this.negativa,
  });
}
