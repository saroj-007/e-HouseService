import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online/loginPage.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


final emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

// function for recovering password if user forget password by sending an email verification link
  forgotPassword() async {
    try {
      await FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text);
      Fluttertoast.showToast(msg: "Reset password link successfully sent to this email");

    }
    on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        gravity: ToastGravity.CENTER
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reset Password"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.only(left:12, top: 80, right: 10),
              child: Container(
                  height: 50,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                  ]),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null) {
                        return "Please fill this form";
                      } else {}
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        border: InputBorder.none,
                        hintText: "Enter your fullname"),
                  ),
                ),
            ),

           const  SizedBox(
                height: 60,
              ),

              InkWell(
                onTap: () async {
                 // Check whether the text field left blank or not
                        if (_formKey.currentState!.validate()){

                          // check the email validation and store boolean result
                          bool isValid = EmailValidator.validate(emailController.text);

                          // Check whether the email valid or not
                          // if valid then route to diffrent page 
                          if (isValid) {
                            forgotPassword();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                          }
                          else {
                            Fluttertoast.showToast(msg: "Invalid email address entered");
                          }
                        }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                      child: Text(
                    "Reset Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
                ),
              ),
          ],
        )
        


              
      ),
    );
  }
}