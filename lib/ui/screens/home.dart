import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/screens/signin.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
              text: 'Hey ',
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: 'Het!',
                    style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    )),
              ]),
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile avatar.png'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignInScreen()));
              });
            },
            icon: Icon(
              Icons.logout_rounded,
              color: darkBlue,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // search bar + filter

          // tips card

          // recommended job card

        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
