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
    d

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
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "E-mail",
                  label: Text('e-mail'),
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
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    // hintText: "E-mail",
                    label: Text('password'),
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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      width: 120,
                      color: Colors.grey.shade300,
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
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/logo/img.png',
                      ),
                      width: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Continue with Google',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Create an account',
                style: TextStyle(
                    color: Color(0xff2F4EFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
