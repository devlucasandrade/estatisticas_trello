import 'package:estatisticas_trello/src/model/card_model.dart';
import 'package:estatisticas_trello/src/service/api/repositories/card_repository.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ocorrências',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.amber,
            width: 250,
            height: 400,
            child: FutureBuilder<List<CardModel>>(
              future: CardRepository().getCardsOnBoard(),
              builder: (context, snapshot) {
                final card = snapshot.data;
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: card?.length,
                    itemBuilder: (context, index) {
                      final cardIndex = card?[index];
                      return Container(
                        color: Colors.blue,
                        width: 200,
                        height: 100,
                        child: FutureBuilder<CardModel>(
                          future: CardRepository().getCard(cardIndex?.id ?? ''),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: cardIndex?.labels?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Text(
                                        cardIndex?.labels?[index].name ??
                                            'nada',
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        cardIndex?.labels?[index].color ??
                                            'nada',
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

// allMatches
// Text('TV: ${'TV Bahia'.allMatches('${cardList?.desc}').length}',),
