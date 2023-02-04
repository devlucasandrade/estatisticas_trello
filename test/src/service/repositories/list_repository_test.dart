import 'package:estatisticas_trello/src/service/api/repositories/list_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = ListRepository();

  test('Deve retornar ID e NOME das LISTAS do BOARD', () async {
    final response = await repository.getListsOnBoard();
    for (int i = 0; i < response.length; i++) {
      // print('ID: ${response[i].id} - Lista: ${response[i].name}');

      final getlist = await repository.getList(response[i].id);
      print('ID: ${getlist.id} - Nome: ${getlist.name}');
    }
  });
}
