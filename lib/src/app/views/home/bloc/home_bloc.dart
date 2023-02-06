// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/model/board_model.dart';
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

  Future<LabelsInt> getTotalLabels() async {
    final response = await cardRepository.getCardsOnBoard();
    int impressa = 0;
    String labelImpressa = '';
    int digital = 0;
    String labelDigital = '';
    int televisao = 0;
    String labelTelevisao = '';
    int radio = 0;
    String labelRadio = '';
    int espontanea = 0;
    String labelEspontanea = '';
    int respostaImprenssa = 0;
    String labelRespostaImprenssa = '';
    int artigo = 0;
    String labelArtigo = '';
    int positiva = 0;
    String labelPositiva = '';
    int neutra = 0;
    String labelNeutra = '';
    int negativa = 0;
    String labelNegativa = '';

    for (int i = 0; i < response.length; i++) {
      final card = await cardRepository.getCard(response[i].id);
      for (int i = 0; i < card.labels!.length; i++) {
        //Tipo de Veículo
        if (card.labels?[i].id == '63d32a592f36f2348afdde93') {
          impressa += 1;
          labelImpressa = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9a') {
          digital += 1;
          labelDigital = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9d') {
          televisao += 1;
          labelTelevisao = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9f') {
          radio += 1;
          labelRadio = card.labels?[i].name ?? StringConstants.empty;
        }

        // Tipo de Mídia
        if (card.labels?[i].id == '63d32a592f36f2348afdde9c') {
          espontanea += 1;
          labelEspontanea = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d8281406cd8985df9d9dc8') {
          respostaImprenssa += 1;
          labelRespostaImprenssa =
              card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d32a592f36f2348afdde9e') {
          artigo += 1;
          labelArtigo = card.labels?[i].name ?? StringConstants.empty;
        }

        // Classificação
        if (card.labels?[i].id == '63d8088af08b6afb46eb7cea') {
          positiva += 1;
          labelPositiva = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d80895ddced7edfd4e3d99') {
          neutra += 1;
          labelNeutra = card.labels?[i].name ?? StringConstants.empty;
        }
        if (card.labels?[i].id == '63d80890851304be2d6e70b4') {
          negativa += 1;
          labelNegativa = card.labels?[i].name ?? StringConstants.empty;
        }
      }
    }
    return LabelsInt(
        impressa: impressa,
        labelImpressa: labelImpressa,
        digital: digital,
        labelDigital: labelDigital,
        televisao: televisao,
        labelTelevisao: labelTelevisao,
        radio: radio,
        labelRadio: labelRadio,
        espontanea: espontanea,
        labelEspontanea: labelEspontanea,
        respostaImprenssa: respostaImprenssa,
        labelRespostaImprenssa: labelRespostaImprenssa,
        artigo: artigo,
        labelArtigo: labelArtigo,
        positiva: positiva,
        labelPositiva: labelPositiva,
        neutra: neutra,
        labelNeutra: labelNeutra,
        negativa: negativa,
        labelNegativa: labelNegativa);
  }
}

class LabelsInt {
  int impressa;
  String labelImpressa;
  int digital;
  String labelDigital;
  int televisao;
  String labelTelevisao;
  int radio;
  String labelRadio;
  int espontanea;
  String labelEspontanea;
  int respostaImprenssa;
  String labelRespostaImprenssa;
  int artigo;
  String labelArtigo;
  int positiva;
  String labelPositiva;
  int neutra;
  String labelNeutra;
  int negativa;
  String labelNegativa;

  LabelsInt({
    required this.impressa,
    required this.labelImpressa,
    required this.digital,
    required this.labelDigital,
    required this.televisao,
    required this.labelTelevisao,
    required this.radio,
    required this.labelRadio,
    required this.espontanea,
    required this.labelEspontanea,
    required this.respostaImprenssa,
    required this.labelRespostaImprenssa,
    required this.artigo,
    required this.labelArtigo,
    required this.positiva,
    required this.labelPositiva,
    required this.neutra,
    required this.labelNeutra,
    required this.negativa,
    required this.labelNegativa,
  });
}
