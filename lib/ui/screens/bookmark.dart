import 'package:flutter/material.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('bookmark'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}