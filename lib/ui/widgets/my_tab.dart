import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';

class MyTab extends StatelessWidget {
  final String titleText;
  const MyTab({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
