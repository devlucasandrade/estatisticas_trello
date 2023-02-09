import 'package:estatisticas_trello/src/app/core/constants/icons_constants.dart';
import 'package:estatisticas_trello/src/app/core/constants/string_constants.dart';
import 'package:estatisticas_trello/src/app/views/home/bloc/home_bloc.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/ocorrencias_anual_barras.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/ocorrencias_anual_donuts.dart';
import 'package:estatisticas_trello/src/app/views/home/widgets/refresh_widget.dart';
import 'package:estatisticas_trello/src/components/text/text_styles.dart';
import 'package:estatisticas_trello/src/model/list_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyRefresh = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future carregarDados() async {
    keyRefresh.currentState?.show();
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      homeBloc.getGeral();
    });
  }

  final homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF3399ff),
      appBar: AppBar(
        backgroundColor: const Color(0XFF3399ff),
        centerTitle: true,
        title: FutureBuilder(
          future: homeBloc.getBoardName(),
          builder: (context, snapshot) {
            final board = snapshot.data;
            return Text(
              board?.name.toUpperCase() ?? StringConstants.empty,
              style: TextStyles.appBarTitle(),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => carregarDados(),
            icon: IconConstants.refresh,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: RefreshWidget(
            key: keyRefresh,
            onRefresh: () => carregarDados(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<LabelsInt>(
                future: homeBloc.getTotalLabels(),
                builder: (context, snapshot) {
                  final label = snapshot.data;
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    'OCORRÊNCIAS - ANUAL',
                                    style: TextStyles.title2(),
                                  ),
                                ),
                              ),
                              OcorrenciasAnualDonuts(label: label),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        FutureBuilder<List<ListModel>>(
                          future: homeBloc.getListsOnBoard(),
                          builder: (context, snapshot) {
                            final list = snapshot.data;
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.60,
                                child: ListView.builder(
                                  itemCount: list?.length ?? 12,
                                  itemBuilder: (context, index) {
                                    final mes = list?[index].name.toUpperCase();
                                    return Card(
                                      elevation: 10,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(
                                            mes.toString(),
                                            style: TextStyles.title2(),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                            child: OcorrenciasAnualBarras(
                                              listId: list?[index].id ??
                                                  StringConstants.mesBase,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
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
      ),
    );
  }
}
