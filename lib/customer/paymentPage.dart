import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online/customer/homePage.dart';
import 'package:online/customer/mainPage.dart';
import 'package:online/provider/orderProvider.dart';

final userId = FirebaseAuth.instance.currentUser!.uid;

class PaymentMethod extends StatefulWidget {
  PaymentMethod(
      {super.key,
      required this.jobRole,
      required this.location,
      required this.phoneNumber,
      required this.docId,
      required this.workerName});
  String jobRole;
  String location;
  String phoneNumber;
  String docId;
  String workerName;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "eHome Service",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        return SafeArea(
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Payment",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ListTile(
                leading: Text(
                  "Working Charge",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: Text(
                  "Rs 10,000",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const ListTile(
                leading: Text(
                  "Delivery Charge",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: Text("Rs 100"),
              ),
              const ListTile(
                leading: Text(
                  "Tax",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: Text("Rs 80"),
              ),
              const ListTile(
                leading: Text(
                  "Total",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: Text(
                  "Rs 10,180",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Username",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 30,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        isDense: true, contentPadding: EdgeInsets.all(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "PIN",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 30,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        isDense: true, contentPadding: EdgeInsets.all(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  final response = await ref.read(orderProvider).postOrder(
                      jobRole: widget.jobRole,
                      location: widget.location,
                      phoneNumber: widget.phoneNumber,
                      docId: widget.docId,
                      paymentStatus: true);
                  await ref.read(orderProvider).myOrders(
                      workerId: widget.docId,
                      userId: userId,
                      workerName: widget.workerName,
                      totalAmount: "Rs 10,180",
                      workerLocation: widget.location,
                      phoneNumber: widget.phoneNumber,
                      ratings: "5");
                  if (response == "Success") {
                    Get.to(() => MainPage(
                          index: 0,
                        ));
                  } else {
                    print(response);
                  }
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(220, 237, 23, 23),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                      child: Text(
                    "Pay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
