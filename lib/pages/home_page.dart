import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadius = 100;
  // ツイーンアニメーションビルダー
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  //アニメーションコントローラー
  AnimationController? _starIconAnimationController;

  // アニメーションを初期化
  @override
  void initState() {
    super.initState();
    _starIconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimationButton(),
                _starIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 背景の関数
  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: const Duration(seconds: 1),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  // 円形のコンテナの関数
  Widget _circularAnimationButton() {
    // GestureDetectorは、画面のタップやスワイプに関する処理を実装することができるので、アプリ開発には欠かせないウィジェット
    return Center(
      // Centarでラップするとボタンを中央寄せにする
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadius += _buttonRadius == 200 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2), // 持続時間2秒
          curve: Curves.bounceInOut, // ゆっくり動くアニメーション機能をつける
          height: _buttonRadius,
          width: _buttonRadius,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
          child: const Center(
            child: Text(
              "Basic!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // 星のアイコンの関数
  Widget _starIcon() {
    return const Icon(
      Icons.star,
      size: 100,
      color: Colors.white,
    );
  }
}
