import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color.dart';

Column inputText(String text, String hintText, TextEditingController controller,
    bool obscT) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // heading
      RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: '$text ',
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0.0, -7.0),
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 8),
      // textfield
      TextField(
        controller: controller,
        obscureText: obscT,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: '$hintText',
          fillColor: Colors.grey[150],
          filled: true,
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

GestureDetector singInUp(BuildContext context, bool isLogin, Function clickMe) {
  return GestureDetector(
    onTap: () {
      clickMe();
    },
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          isLogin ? "Login" : "Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

// Stack spark_card(
//     BuildContext context, String imgUrl, String name, String about) {
//   return Stack(
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width - 48,
//         height: MediaQuery.of(context).size.height - 300,
//         // color: blue,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(
//               imgUrl,
//             ),
//             fit: BoxFit.fill,
//           ),
//           borderRadius: BorderRadius.circular(32.0),
//         ),
//       ),
//       BackdropFilter(
//         filter: new ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width - 48,
//           height: MediaQuery.of(context).size.height - 300,
//           // color: blue,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: FractionalOffset.topCenter,
//               end: FractionalOffset.bottomCenter,
//               colors: [
//                 Colors.grey.withOpacity(0.0),
//                 Colors.black,
//               ],
//               stops: [0.0, 1.0],
//             ),
//             borderRadius: BorderRadius.circular(32.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: GoogleFonts.lato(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 32,
//                       color: Colors.white),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   about,
//                   style: GoogleFonts.lato(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Container session_tile(BuildContext context, String name, String time) {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(24),
//       color: Colors.grey[100],
//     ),
//     child: ListTile(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (builder) => MyHomePage()));
//       },
//       title: Text(
//         name,
//         style: GoogleFonts.lato(color: Colors.grey[600]),
//       ),
//       trailing: Text(
//         time,
//         style: GoogleFonts.lato(
//           color: Colors.grey[500],
//         ),
//       ),
//     ),
//   );
// }

// List<dynamic> pref = [
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0,
//   0
// ];
// String uid = (FirebaseAuth.instance.currentUser?.uid).toString();

// Column displayInterests(BuildContext context, String heading,
//     List<String> myInterests, List<int> val) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         heading,
//         style: GoogleFonts.lato(),
//       ),
//       SizedBox(height: 8),
//       ListView.builder(
//         itemCount: myInterests.length,
//         shrinkWrap: true,
//         // scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               FirebaseFirestore.instance
//                   .collection("users")
//                   .doc(uid)
//                   .get()
//                   .then(
//                 (DocumentSnapshot doc) {
//                   final data = doc.data() as Map<String, dynamic>;
//                   pref = data['pref'];
//                   pref[val[index]] = pref[val[index]] == 0 ? 1 : 0;
//                   FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(uid)
//                       .update({'pref': pref});
//                 },
//                 onError: (e) => print("Error getting document: $e"),
//               );
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
//               child: Text(
//                 myInterests[index],
//                 style: GoogleFonts.lato(),
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(color: black),
//                 borderRadius: BorderRadius.circular(16),
//                 color: pref[val[index]] == 1
//                     ? Color(0xFFCFB3CD).withOpacity(0.6)
//                     : Colors.grey[200],
//               ),
//             ),
//             splashColor: pink,
//           );
//         },
//       ),
//       SizedBox(height: 12),
//     ],
//   );
// }
