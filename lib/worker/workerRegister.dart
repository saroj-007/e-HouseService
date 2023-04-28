import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online/loginPage.dart';
import 'package:online/provider/authProvider.dart';

class workerSignUpPage extends StatefulWidget {
  workerSignUpPage({super.key});

  @override
  State<workerSignUpPage> createState() => _workerSignUpPageState();
}

class _workerSignUpPageState extends State<workerSignUpPage> {
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final experienceController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();

  final _form = GlobalKey<FormState>();
  String initialValue = "Select";

  List<String> jobRole = [
    "Select",
    "Plumber",
    "Electrician",
    "Painter",
    "Gardener",
    "Carpenter",
    "Cleaner"
  ];

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
                "Phone",
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
                  controller: phoneController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: "Enter your phone"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                " Job Role",
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    // Initial Value
                    value: initialValue,

                    // Down Arrow Icon
                    // icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: jobRole.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        initialValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Experience",
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: experienceController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.verified_user_outlined),
                      border: InputBorder.none,
                      hintText: "  Enter your experience (months)"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Location",
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null) {
                      return "Please fill this form";
                    } else {}
                  },
                  controller: locationController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      border: InputBorder.none,
                      hintText: "  Enter your location"),
                ),
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
                  controller: repasswordController,
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
                  if (_form.currentState!.validate() &&
                      initialValue != "Select") {
                    FocusScope.of(context).unfocus();
                    final response = await ref.watch(authprovider).workerSignUp(     // function for worker registration
                        email: emailController.text.trim(),
                        fullName: fullNameController.text.trim(),
                        experience: experienceController.text.trim(),
                        jobRole: initialValue,
                        location: locationController.text.trim(),
                        phoneNumber: phoneController.text.trim(),
                        password: passwordController.text.trim());
                    if (response == "Success") {
                      Get.to(() => const LoginPage());
                    } else {
                      print(response.toString());
                    }
                  } else {}
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
                        Get.to(() => const LoginPage());
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
