import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String image;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: _size.height * 0.55,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0.0,
                      left: -_size.width / 2,
                      child: Container(
                        height: _size.height * 0.55,
                        width: _size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFCEE0),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(36.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: defaultPadding,
                      left: defaultPadding,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                            "lib/screens/purchaseScreen/assets/icons/Arrow - Left.svg"),
                      ),
                    ),
                    Positioned(
                      top: defaultPadding,
                      right: defaultPadding,
                      child: SvgPicture.asset(
                        "lib/screens/purchaseScreen/assets/icons/Heart.svg",
                        color: const Color(0xFF222020),
                      ),
                    ),
                    Hero(
                      tag: image,
                      child: Image.asset(
                        image,
                        height: 380.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        color: Color(0xFF8B8BA1),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFCEE0),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        const Text(
                          "1",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFFFFCEE0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => SvgPicture.asset(
                            "lib/screens/purchaseScreen/assets/icons/Star.svg",
                            height: 26.0,
                          ),
                        ),
                        const SizedBox(width: defaultPadding / 2),
                        const Text(
                          "5.0",
                          style: TextStyle(
                            color: Color(0xFF979797),
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: const [
                        AddToCartButton(),
                        SizedBox(width: defaultPadding),
                        BuyNowButton(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          alignment: Alignment.center,
          minimumSize: const Size(double.infinity, 62.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          shadowColor: primaryColor,
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text(
          "Buy now",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFFCEE0),
          alignment: Alignment.center,
          minimumSize: const Size(double.infinity, 60.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          shadowColor: primaryColor.withOpacity(0.4),
          textStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add to cart",
              style: TextStyle(
                color: Color(0xFF222020),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            SvgPicture.asset(
              "lib/screens/purchaseScreen/assets/icons/Buy.svg",
              color: const Color(0xFF222020),
            ),
          ],
        ),
      ),
    );
  }
}
