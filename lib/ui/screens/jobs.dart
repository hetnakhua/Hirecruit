import 'package:flutter/material.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('jobs'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}