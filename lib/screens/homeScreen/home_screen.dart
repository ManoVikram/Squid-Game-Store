import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

import './widgets/home_screen_app_bar.dart';
import './widgets/product_card.dart';
import './widgets/recent_orders_cart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 248, 247, 247),
      backgroundColor: const Color(0xFFF8F8F8),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: HomeScreenAppBar(searchController: _searchController),
              ),
              const SizedBox(height: defaultPadding * 1.5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
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
              const SizedBox(height: defaultPadding / 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
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
                      image: "lib/screens/homeScreen/assets/images/Doll.png",
                      quantity: 1,
                    ),
                    const SizedBox(width: defaultPadding),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
