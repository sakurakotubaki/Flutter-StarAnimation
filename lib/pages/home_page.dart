import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            _circularAnimationButton(),
            ],
        ),
      ),
    );
  }

  // 背景の関数
  Widget _pageBackground() {
    return Container(
      color: Colors.blue,
    );
  }

  // 円形のコンテナの関数
  Widget _circularAnimationButton() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(100)),
    );
  }
}
