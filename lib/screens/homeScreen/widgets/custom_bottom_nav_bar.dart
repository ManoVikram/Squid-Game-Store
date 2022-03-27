import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: _size.height * 0.16,
          width: double.infinity,
          color: const Color(0xFFF8F8F8),
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withOpacity(0.4),
                            primaryColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0.0, 10.0),
                            color: primaryColor.withOpacity(0.32),
                            blurRadius: 24.0,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      "lib/screens/homeScreen/assets/icons/Home.svg",
                      height: 24.0,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "lib/screens/homeScreen/assets/icons/Buy.svg",
                  height: 24.0,
                ),
                SvgPicture.asset(
                  "lib/screens/homeScreen/assets/icons/Heart.svg",
                  color: const Color(0xFF8B8BA1),
                  height: 24.0,
                ),
                SvgPicture.asset(
                  "lib/screens/homeScreen/assets/icons/Setting.svg",
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 48.0,
          left: _size.width / 4 - 45.0,
          child: SvgPicture.asset(
              "lib/screens/homeScreen/assets/icons/SelectedNavButtonBottomElement.svg"),
        ),
      ],
    );
  }
}