import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

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