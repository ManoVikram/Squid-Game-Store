import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

import '../../purchaseScreen/purchase_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required Size size,
    required this.name,
    required this.image,
    this.isStarred = false,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String name;
  final String image;
  final bool isStarred;

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
                    if (isStarred)
                      SvgPicture.asset(
                          "lib/screens/homeScreen/assets/icons/Star.svg"),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  onPressed: () {
                    /* Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseScreen(
                          image: image,
                          name: name,
                          price: 10.4,
                        ),
                      ),
                    ); */
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: PurchaseScreen(
                            image: image,
                            name: name,
                            price: 99.9,
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    minimumSize: const Size(double.infinity, 50.0),
                    elevation: 12.0,
                    shadowColor: primaryColor.withOpacity(0.4),
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
        Hero(
          tag: image,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: _size.height * 0.41,
          ),
        ),
      ],
    );
  }
}
