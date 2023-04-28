import 'package:flutter/material.dart';
import 'package:online/customer/customerRegister.dart';
import 'package:online/worker/workerRegister.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              child: const TabBar(tabs: [
                Tab(
                  text: "Customer",
                ),
                Tab(
                  text: "Worker",
                ),
              ]),
            ),
            Expanded(
                child: TabBarView(children: [SignUpPage(), workerSignUpPage()]))
          ],
        ),
      ),
    );
  }
}
