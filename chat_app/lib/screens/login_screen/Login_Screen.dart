import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 15,
              // ),
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome back to the app',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              Text('E-mail Address'),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "E-mail",
                  label: Text('email'),
                  // labelText: "sjdj"
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?',
                        style: TextStyle(
                          color: Colors.blueAccent.shade400,
                        )),
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    // hintText: "E-mail",
                    label: Text('email'),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.eye,
                        color: Colors.grey,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Checkbox(value: value, onChanged: ())
                  Text(
                    'Keep me signed in',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff2F4EFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
                // width: ,
              ),

              // Text('data'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('or sign in with'),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: Row(
                  children: [Image(image: AssetImage('assets/1.png'))],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
