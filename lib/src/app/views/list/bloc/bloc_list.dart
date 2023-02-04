// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:estatisticas_trello/src/service/api/repositories/card_repository.dart';

class BlocList {
  final cardRepository = CardRepository();

  Future<LabelsInt> getTotalLabels() async {
    final response = await cardRepository.getCardsOnBoard();
    int impressa = 0;
    int digital = 0;
    int televisao = 0;
    int radio = 0;

    for (int i = 0; i < response.length; i++) {
      final card = await cardRepository.getCard(response[i].id);
      for (int i = 0; i < card.labels!.length; i++) {
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
      }
    }
    return LabelsInt(
      impressa: impressa,
      digital: digital,
      televisao: televisao,
      radio: radio,
    );
  }
}

class LabelsInt {
  int impressa;
  int digital;
  int televisao;
  int radio;

  LabelsInt({
    required this.impressa,
    required this.digital,
    required this.televisao,
    required this.radio,
  });
}
