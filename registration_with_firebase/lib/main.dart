import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_options.dart';
import 'login.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  registrationFunction() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      if (e.toString().contains('firebase_auth/email-already-in-use')) {
        Fluttertoast.showToast(
            msg: 'The email address is already in use by another account.');
      } else if (e.toString().contains('firebase_auth/weak-password')) {
        Fluttertoast.showToast(msg: 'Password should be at least 6 characters');
      } else if (e.toString().contains('firebase_auth/invalid-email')) {
        Fluttertoast.showToast(msg: 'The email address is badly formatted.');
      } else if (e.toString().contains('firebase_auth/channel-error')) {
        Fluttertoast.showToast(
            msg: 'Unable to establish connection on channel.',
            backgroundColor: Colors.red);
      }
      rethrow;
      // TODO
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  loginWithGoogle() async {
    GoogleSignIn google=GoogleSignIn();
    var user=await google.signIn();
    
    final GoogleSignInAuthentication? googleAuth=await user?.authentication;
    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('registration'),
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
                        registrationFunction();
                      }
                    },
                    child: Text('Registration')),
            
            TextButton(onPressed: (){
              loginWithGoogle();
            }, child: Text('Log in with Google'))
          ],
        ),
      ),
    );
  }
}
