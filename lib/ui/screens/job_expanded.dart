import 'package:flutter/material.dart';

class JobExpandedScreen extends StatefulWidget {
  const JobExpandedScreen({super.key});

  @override
  State<JobExpandedScreen> createState() => _JobExpandedScreenState();
}

class _JobExpandedScreenState extends State<JobExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('expanded job'),
    );
  }
}