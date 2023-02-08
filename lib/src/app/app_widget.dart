import 'package:estatisticas_trello/src/app/views/home/pages/home_page.dart';
import 'package:estatisticas_trello/src/app/views/splash/splash_page.dart';
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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
