import 'package:estatisticas_trello/src/app/views/list/pages/list_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estatísticas Trello',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ListPage(),
      },
    );
  }
}
