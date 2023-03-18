import 'package:flutter/material.dart';
import 'package:hirecruit/ui/screens/signup.dart';
import 'package:hirecruit/ui/widgets/re_use.dart';

import '../../constants/color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  var _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // logo
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 48, 0),
                  child: Image.asset('assets/spark logo rect.png'),
                ),
                SizedBox(height: 60),

                // inputText('Name', 'eg: Het Nakhua', controller, obscT),
                inputText('Email', 'eg: hetnakhua@gmail.com', _email, false),
                inputText('Password', 'eg: #het493', _pass, true),

                SizedBox(
                  height: 40,
                ),
                singInUp(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _pass.text)
                      .then((value) {
                    setState(() => _error = 'Signed In Successfully');
                    print(_error);
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
                signUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Do not have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            "Register!",
            style: TextStyle(color: blue),
          ),
        ),
      ],
    );
  }
}
