import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Hero(
            tag: 'logo',
            child: Image.asset('assets/logo.png'))
    );
  }
}
