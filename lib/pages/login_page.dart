import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sedekah/component/myButton.dart';
import 'package:sedekah/component/textfield.dart';
import 'package:sedekah/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  //login method
  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    //try sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    }

    //display error

    on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.person,
                size: 80,
              ),

              const SizedBox(
                height: 25,
              ),

              //app name
              Text(
                "Sedekah.",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 40,
              ),
              //email textfield

              MyTextfield(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailcontroller),

              SizedBox(
                height: 20,
              ),

              //password textfield

              MyTextfield(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordcontroller),

              SizedBox(
                height: 20,
              ),

              //forgot password

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?"),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //sign in button
              Mybutton(text: "Log In", onTap: login),

              SizedBox(
                height: 20,
              ),

              //don't have an account? Register here

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "   Register Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
