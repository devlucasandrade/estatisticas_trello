import 'package:estatisticas_trello/src/app/views/list/bloc/bloc_list.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CLIPPING 2023',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: FutureBuilder<LabelsInt>(
            future: BlocList().getTotalLabels(),
            builder: (context, snapshot) {
              final label = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  color: Colors.blue[200],
                  padding: const EdgeInsets.all(20),
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Text('Impressa: ${label?.impressa}'),
                      Text('Digital: ${label?.digital}'),
                      Text('Televisão: ${label?.televisao}'),
                      Text('Rádio: ${label?.radio}'),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
