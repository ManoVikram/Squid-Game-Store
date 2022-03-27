import 'package:flutter/material.dart';

import '../../constants.dart';

import './widgets/home_screen_app_bar.dart';
import './widgets/product_card.dart';
import './widgets/recent_orders_cart.dart';
import './widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
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
      // backgroundColor: Color.fromARGB(255, 248, 247, 247),
      backgroundColor: const Color(0xFFF8F8F8),
      /* bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: primaryColor,
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withOpacity(0.5),
                        // Color.fromARGB(255, 255, 0, 98),
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
                  height: 26.0,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "lib/screens/homeScreen/assets/icons/Buy.svg",
              height: 26.0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "lib/screens/homeScreen/assets/icons/Heart.svg",
              color: const Color(0xFF8B8BA1),
              height: 26.0,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset(
              "lib/screens/homeScreen/assets/icons/Setting.svg",
              height: 26.0,
            ),
          ),
        ],
      ), */
      bottomNavigationBar: AnimatedBuilder(
          animation: _animationController,
          builder: (context, snapshot) {
            return SlideTranslateAnimation(
              animationController: _animationController,
              size: _size,
              child: CustomBottomNavBar(size: _size),
              translateDirection: 2,
              // Don't send negative values
              // They are taken care of in the SlideTranslateAnimation widget
              offsetValue: 100,
            );
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: SlideTranslateAnimation(
                        animationController: _animationController,
                        size: _size,
                        offsetValue: 100,
                        translateDirection: 1,
                        child: HomeScreenAppBar(
                            searchController: _searchController),
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 1.5),
                    SlideTranslateAnimation(
                      animationController: _animationController,
                      size: _size,
                      offsetValue: 100,
                      translateDirection: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Text(
                              "Recommended for you",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ProductCard(
                                  size: _size,
                                  name: "Supervisor toy",
                                  image:
                                      "lib/screens/homeScreen/assets/images/StaffToy_01.png",
                                ),
                                ProductCard(
                                  size: _size,
                                  name: "Front man toy",
                                  image:
                                      "lib/screens/homeScreen/assets/images/BlackMasterToy.png",
                                ),
                                const SizedBox(width: defaultPadding),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    SlideTranslateAnimation(
                      animationController: _animationController,
                      size: _size,
                      offsetValue: 100,
                      translateDirection: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            child: Text(
                              "Recommended for you",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                RecentOrdersCard(
                                  size: _size,
                                  name: "Collector outfit",
                                  image:
                                      "lib/screens/homeScreen/assets/images/StaffToy_02.png",
                                  quantity: 3,
                                ),
                                RecentOrdersCard(
                                  size: _size,
                                  name: "Doll",
                                  image:
                                      "lib/screens/homeScreen/assets/images/Doll.png",
                                  quantity: 1,
                                ),
                                const SizedBox(width: defaultPadding),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class SlideTranslateAnimation extends StatelessWidget {
  const SlideTranslateAnimation({
    Key? key,
    required AnimationController animationController,
    required Size size,
    required this.child,
    required this.translateDirection,
    required this.offsetValue,
  })  : _animationController = animationController,
        _size = size,
        super(key: key);

  final AnimationController _animationController;
  final Size _size;
  final Widget child;

  /// 1 - From Top
  /// 2 - From Bottom
  /// 3 - From Left
  /// 4 - From Right
  final int translateDirection;
  final double offsetValue;

  @override
  Widget build(BuildContext context) {
    double offsetX = 0.0;
    double offsetY = 0.0;

    if (translateDirection == 1) {
      offsetY = -offsetValue;
    } else if (translateDirection == 2) {
      offsetY = offsetValue;
    } else if (translateDirection == 3) {
      offsetX = -offsetValue;
    } else if (translateDirection == 4) {
      offsetX = offsetValue;
    }

    return Opacity(
      opacity: _animationController.value,
      child: Transform.translate(
        offset: Offset(
          offsetX * (1 - _animationController.value),
          offsetY * (1 - _animationController.value),
        ),
        child: child,
      ),
    );
  }
}


