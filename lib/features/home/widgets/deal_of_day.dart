import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(style: TextStyle(fontSize: 20), "Deal of the day"),
        ),
        Image.network(
          "https://images.pexels.com/photos/256450/pexels-photo-256450.jpeg",
          height: 235,
          // fit: BoxFit.fitHeight
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Pranay',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/917Bc9C1MlL._AC_UL210_SR195,210_.jpg",
                fit: BoxFit.fitHeight,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/917Bc9C1MlL._AC_UL210_SR195,210_.jpg",
                fit: BoxFit.fitHeight,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/917Bc9C1MlL._AC_UL210_SR195,210_.jpg",
                fit: BoxFit.fitHeight,
                height: 100,
                width: 100,
              ),
              Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/917Bc9C1MlL._AC_UL210_SR195,210_.jpg",
                fit: BoxFit.fitHeight,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
