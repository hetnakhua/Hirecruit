import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/widgets/navbar.dart';
import 'package:hirecruit/ui/widgets/re_use.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.fromLTRB(150, 50, 150, 20),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile avatar.png',
                ),
                maxRadius: 80,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Het Nakhua',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 28),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'hetnakhua@gmail.com',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Skills',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800, fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, item) {
                return skills('HTML');
              },
              itemCount: 2,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, item) {
                return skills('HTML');
              },
              itemCount: 2,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
