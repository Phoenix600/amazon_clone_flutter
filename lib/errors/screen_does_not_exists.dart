import 'package:flutter/material.dart';

class ScreenDoesNotExists extends StatelessWidget {
  const ScreenDoesNotExists({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Screen Does Not Exists....",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
