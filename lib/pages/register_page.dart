import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sedekah/component/myButton.dart';
import 'package:sedekah/component/textfield.dart';
import 'package:sedekah/helper/helper_function.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPWcontroller = TextEditingController();

  //register method
  void registerUser() async {
    //show loading circle

    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // make sure passwords match

    if (passwordcontroller.text != confirmPWcontroller.text) {
      //pop loading circle
      Navigator.pop(context);

      //show error.
      displayMessageToUser("Password don't match", context);
    }
    else {
      // try creating the user

    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      displayMessageToUser(e.code, context);
    }
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
              //username textfield

              MyTextfield(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernamecontroller),

              SizedBox(
                height: 20,
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
              //confirm password textfield

              MyTextfield(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPWcontroller),

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

              //register button
              Mybutton(text: "Register", onTap: registerUser),

              SizedBox(
                height: 20,
              ),

              //Already have an account? Register here

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "   Login Here",
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
