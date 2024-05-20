import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  loaginFunction() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
    }catch (e) {
      if(e.toString().contains('firebase_auth/invalid-email')){
        Fluttertoast.showToast(msg: 'incorrect Email');
      }else if(e.toString().contains('firebase_auth/invalid-credential')){
        Fluttertoast.showToast(msg: 'incorrect Password');

      }
        rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Email...";
                }
              },
              decoration: InputDecoration(hintText: "Enter Your Email"),
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Password...";
                }
              },
              decoration: InputDecoration(hintText: "Enter Your Password"),
            ),
            SizedBox(
              height: 20,
            ),
            (isLoading == true)
                ? ElevatedButton(
                onPressed: () {
                  // registrationFunction();
                },
                child: CircularProgressIndicator())
                : ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    loaginFunction();

                  }
                },
                child: Text('Login')),

          ],
        ),
      ),
    );
  }
}
