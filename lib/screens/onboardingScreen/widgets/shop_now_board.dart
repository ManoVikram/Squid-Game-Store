import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../homeScreen/home_screen.dart';

class ShopNowBoard extends StatelessWidget {
  const ShopNowBoard({
    Key? key,
    required Animation<double> squidGameShopAnimation,
    required Size size,
  })  : _squidGameShopAnimation = squidGameShopAnimation,
        _size = size,
        super(key: key);

  final Animation<double> _squidGameShopAnimation;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _squidGameShopAnimation.value,
      child: Transform.translate(
        offset: Offset(0.0, 200 * (1 - _squidGameShopAnimation.value)),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Container(
            height: _size.height * 0.4,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "lib/screens/onboardingScreen/assets/images/SquidGameLogo.png"),
                const Text(
                  "Shop your favourite toys and outfits of the Squid Game on the go!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    onPrimary: Colors.white,
                    minimumSize: const Size(double.infinity, 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  child: const Text(
                    "Shop Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
