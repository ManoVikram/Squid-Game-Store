import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

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