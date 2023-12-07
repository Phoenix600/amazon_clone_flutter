import 'package:amazonclone/constants/global_constants.dart';
import 'package:amazonclone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // temp list of products
  List list = [
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
    "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Text(
                  style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                  ),
                  'See all'),
            )
          ],
        ),
        // Display Orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: list.elementAt(index));
            },
          ),
        )
      ],
    );
  }
}
