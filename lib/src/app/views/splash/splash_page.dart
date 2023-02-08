import 'package:estatisticas_trello/src/app/core/constants/assets_constants.dart';
import 'package:estatisticas_trello/src/components/text/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    defineRoute();
  }

  void defineRoute() async {
    await Future.delayed(const Duration(seconds: 4)).then((_) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFF0066ff),
              Color(0XFFccffff),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeAnimation(
                delay: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    AssetsConstants.assets.logo,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              ),
              FadeAnimation(
                delay: 2,
                child: Text(
                  'ESTATÍTICAS TRELLO',
                  style: TextStyles.splash(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({
    Key? key,
    required this.delay,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween()
      ..add('opacity', Tween(begin: 0.0, end: 1.0))
      ..add('translateY', Tween(begin: 120.0, end: 0.0));

    return PlayAnimation<MultiTweenValues<dynamic>>(
      delay: Duration(milliseconds: (500) * delay.round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get('opacity'),
        child: Transform.translate(
          offset: Offset(0, animation.get('translateY')),
          child: child,
        ),
      ),
    );
  }
}
