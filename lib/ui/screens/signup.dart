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
  TextEditingController _mob = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  TextEditingController _loc = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _gen = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60),
                // logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 48, 0),
                  child: Image.asset('assets/spark logo rect.png'),
                ),
                SizedBox(height: 40),

                inputText('Name', 'eg: Het Nakhua', _name, false),
                inputText('Email', 'eg: hetnakhua@gmail.com', _email, false),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Mobile',
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
                  controller: _mob,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'eg: 1234567890',
                    fillColor: Colors.grey[150],
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                inputText('Location', 'eg: India', _loc, false),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Age',
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
                  controller: _age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'eg: 18',
                    fillColor: Colors.grey[150],
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                inputText('Gender', 'eg: Male', _gen, false),
                inputText('Password', 'eg: #het493', _pass, true),
                inputText('Confirm Password', 'eg: #het493', _cpass, true),

                SizedBox(
                  height: 40,
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
                    addUser(_name.text, _email.text, uid, _loc.text,
                        int.parse(_age.text), _gen.text, int.parse(_mob.text), [
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0
                    ], []);
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
            style: TextStyle(color: blue),
          ),
        ),
      ],
    );
  }
}
