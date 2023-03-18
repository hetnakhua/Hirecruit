import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';

class MyTab extends StatelessWidget {
  final String titleText;
  const MyTab({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            titleText,
            style: TextStyle(
              fontSize: 36,
            ),
          )),
    );
  }
}
