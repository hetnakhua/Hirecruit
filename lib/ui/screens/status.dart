import 'package:flutter/material.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('status'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}