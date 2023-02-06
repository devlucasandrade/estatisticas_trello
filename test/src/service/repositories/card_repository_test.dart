import 'package:estatisticas_trello/src/service/api/repositories/card_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = CardRepository();
  // const cardId = '63d56f18d836512f8eefd8f3';

  test('Deve retornar ID e NOME dos CARDS do board', () async {
    final response =
        await repository.getCardsOnList('63d32a7ad034775f21c41d33');
    int impressa = 0;
    int digital = 0;
    int televisao = 0;
    int radio = 0;
    for (int i = 0; i < response.length; i++) {
      // print('${response[i].id} - ${response[i].name}');

      final cards = await repository.getCard(response[i].id);
      // print('ID: ${cards.id} - Nome: ${cards.name}');

      for (int i = 0; i < cards.labels!.length; i++) {
        // print('${cards.labels?[i].name} - ${cards.labels?[i].id}');

        if (cards.labels?[i].id == '63d32a592f36f2348afdde93') {
          impressa += 1;
        }
        if (cards.labels?[i].id == '63d32a592f36f2348afdde9a') {
          digital += 1;
        }
        if (cards.labels?[i].id == '63d32a592f36f2348afdde9d') {
          televisao += 1;
        }
        if (cards.labels?[i].id == '63d32a592f36f2348afdde9f') {
          radio += 1;
        }
      }
    }
    print('Impressa - ${impressa}');
    print('Digital - ${digital}');
    print('Televisao - ${televisao}');
    print('Radio - ${radio}');
  });
}
