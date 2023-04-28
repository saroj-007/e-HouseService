import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online/loginPage.dart';
import 'package:online/provider/authProvider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _form,
        child: Consumer(builder: (context, ref, child) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Full Name",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  controller: fullNameController,
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: InputBorder.none,
                      hintText: "Enter your phone number"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Address",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: addressController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: InputBorder.none,
                      hintText: "Enter your address"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: "Enter your email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.verified),
                      suffixIcon: Icon(Icons.visibility),
                      border: InputBorder.none,
                      hintText: "Enter your password"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Confirm Password",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.verified),
                      suffixIcon: Icon(Icons.visibility),
                      border: InputBorder.none,
                      hintText: "Re type your password"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  _form.currentState!.save();
                  if (_form.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    await ref.watch(authprovider).userSignup(
                        fullNameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim());

                    Get.to(() => const LoginPage());
                  } else {
                    Get.defaultDialog(title: "Error");
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
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginPage());
                      },
                      child: const Text("Already have an Account?")),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
