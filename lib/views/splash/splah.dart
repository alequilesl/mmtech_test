import 'package:flutter/material.dart';
import 'package:mmtech_test/routes/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  final style= const TextStyle(
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
    fontSize: 28,
    shadows: [
      Shadow(
        color: Colors.white54,
        offset: Offset(1, 2)
      )
    ]
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: 'logo',
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Center(child: Hero(tag: 'mmtech', child: Text('MMTECH', style: style,))),
            Center(child: Text('SOLUTIONS', style: style,)),
          ],
        ),
      ),
    );
  }
}
