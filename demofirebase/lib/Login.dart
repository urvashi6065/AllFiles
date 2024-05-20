
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Homepage.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  loginFunction() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } catch (e) {
      print('Error');
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Your E-mail",
                border: OutlineInputBorder(),
                label: Text('E-mail'),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
                label: Text('Password'),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  loginFunction();
                },
                child: Text('Log in'))
          ],
        ),
      ),
    );
  }
}
