import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/mes_btn.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/ocorrencias_total.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/pie_chart.dart';
import 'package:estatisticas_trello/src/model/list_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder(
            future: homeBloc.getBoardName(),
            builder: (context, snapshot) {
              final board = snapshot.data;
              return Text(
                board?.name ?? '',
              );
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<LabelsInt>(
              future: homeBloc.getTotalLabels(),
              builder: (context, snapshot) {
                final label = snapshot.data;
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      OcorrenciasTotal(label: label),
                      const SizedBox(height: 20),
                      FutureBuilder<List<ListModel>>(
                        future: homeBloc.getLists(),
                        builder: (context, snapshot) {
                          final list = snapshot.data;
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 8,
                                ),
                                itemCount: list?.length ?? 12,
                                itemBuilder: (context, index) {
                                  final mes = list?[index]
                                      .name
                                      .substring(0, 3)
                                      .toUpperCase();
                                  return MesBtn(mes: mes);
                                },
                              ),
                            );
                          }
                        },
                      )
                    ],
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
