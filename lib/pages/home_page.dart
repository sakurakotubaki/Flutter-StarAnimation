import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _buttonRadius = 100;

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
    // GestureDetectorは、画面のタップやスワイプに関する処理を実装することができるので、アプリ開発には欠かせないウィジェット
    return Center( // Centarでラップするとボタンを中央寄せにする
      child: GestureDetector(
        onTap: () {
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2), // 持続時間2秒
          height: 100,
          width: _buttonRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
        ),
      ),
    );
  }
}
