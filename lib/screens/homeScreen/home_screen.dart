import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 248, 247, 247),
      backgroundColor: const Color(0xFFF8F8F8),
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

class RecentOrdersCard extends StatelessWidget {
  const RecentOrdersCard({
    Key? key,
    required Size size,
    required this.name,
    required this.image,
    required this.quantity,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String name;
  final String image;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding * 2,
            left: defaultPadding,
            bottom: defaultPadding,
          ),
          child: Container(
            height: _size.height * 0.15,
            width: _size.width * 0.7,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 8.0),
                  blurRadius: 14.0,
                  color: const Color(0xFFD9D9E8).withOpacity(0.5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("$quantity items ordered"),
                    // const SizedBox(height: defaultPadding),
                    /* TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        primary: const Color(0xFF8B8BA1),
                      ),
                      child: Text("View details"),
                    ), */
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Text(
                            "View details",
                            style: TextStyle(
                              color: Color(0xFF8B8BA1),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                              "lib/screens/homeScreen/assets/icons/Arrow - Right.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: defaultPadding * 1.5,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: _size.height * 0.2,
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required Size size,
    required this.name,
    required this.image,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding * 3,
            left: defaultPadding,
            bottom: defaultPadding,
          ),
          child: Container(
            height: _size.height * 0.45,
            width: _size.width * 0.6,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 8.0),
                  blurRadius: 14.0,
                  color: const Color(0xFFD9D9E8).withOpacity(0.5),
                ),
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                      "lib/screens/homeScreen/assets/icons/Heart.svg"),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SvgPicture.asset(
                        "lib/screens/homeScreen/assets/icons/Star.svg"),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: const Size(double.infinity, 50.0),
                    elevation: 12.0,
                    shadowColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "View details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: _size.height * 0.41,
        ),
      ],
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key? key,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("lib/screens/homeScreen/assets/images/SquidShopLogo.png"),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: TextField(
            controller: _searchController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 232, 232, 236),
              filled: true,
              hintText: "Search",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: SvgPicture.asset(
                  "lib/screens/homeScreen/assets/icons/SearchIcon.svg",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  height: 30.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(36.0),
                borderSide: BorderSide.none,
              ),
              constraints: const BoxConstraints(
                maxHeight: 50.0,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2,
                horizontal: defaultPadding,
              ),
            ),
          ),
        ),
        const SizedBox(width: defaultPadding),
        SvgPicture.asset(
            "lib/screens/homeScreen/assets/icons/HambugerIcon.svg"),
      ],
    );
  }
}
