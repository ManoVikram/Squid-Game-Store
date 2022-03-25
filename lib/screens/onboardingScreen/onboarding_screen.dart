import 'package:flutter/material.dart';

import './widgets/shop_now_board.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _backgroundAnimation;
  late final Animation<double> _squidGameShopAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _backgroundAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeOut,
      ),
    );

    _squidGameShopAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Transform.scale(
                  scale: (10 * (1 - _backgroundAnimation.value)).clamp(1, 10),
                  child: Image.asset(
                    "lib/screens/onboardingScreen/assets/images/Background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _squidGameShopAnimation.value,
                    child: Transform.translate(
                      offset: Offset(
                          0.0, -100 * (1 - _squidGameShopAnimation.value)),
                      child: Image.asset(
                          "lib/screens/onboardingScreen/assets/images/SquidShopLogo.png"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 54,
                  left: 0,
                  right: 0,
                  child: ShopNowBoard(
                    squidGameShopAnimation: _squidGameShopAnimation,
                    size: _size,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
