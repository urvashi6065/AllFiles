import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool isLoading = false;

  signupFunction() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

    } catch (e) {
      // TODO
    } finally {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'Loading');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (isLoading == true)
                    ? ElevatedButton(
                    onPressed: null, child: CircularProgressIndicator())
                    : ElevatedButton(onPressed: () {
                  signupFunction();
                }, child: Text('Sign Up')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()),
                              (route) => false);
                    },
                    child: Text('Log in'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Log in with google'),
                TextButton(onPressed: (){}, child: Text('Log in'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
