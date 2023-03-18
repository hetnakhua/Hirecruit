import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hirecruit/constants/color.dart';
import 'package:hirecruit/ui/screens/home.dart';
import 'package:hirecruit/ui/screens/signin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/re_use.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();

  var _error = '';
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60),
                // logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 48, 0),
                  child: Image.asset('assets/images/Hirecruit logo black.png'),
                ),
                SizedBox(height: 40),

                inputText('Name', 'eg: Het Nakhua', _name, false),

                inputText('Email', 'eg: hetnakhua@gmail.com', _email, false),

                inputText('Password', 'eg: #het493', _pass, true),

                SizedBox(
                  height: 20,
                ),

                singInUp(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _email.text,
                    password: _pass.text,
                  )
                      .then((value) {
                    setState(() => _error = 'Signed Up Successfully');
                    String uid =
                        (FirebaseAuth.instance.currentUser?.uid).toString();
                    print(_error);
                    // addUser(_name.text, _email.text, uid, _loc.text,
                    //     int.parse(_age.text), _gen.text, int.parse(_mob.text),);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    setState(() => _error = error
                        .toString()
                        .substring(error.toString().indexOf(']') + 2));
                    print(_error);
                  });
                }),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                signIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Text(
            "Login!",
            style: TextStyle(color: darkBlue),
          ),
        ),
      ],
    );
  }
}
