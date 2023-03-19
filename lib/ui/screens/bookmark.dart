import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(color: Colors.black),
        title: Text(
          'Bookmark',
          style: GoogleFonts.lato(color: black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Text('bookmark'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}