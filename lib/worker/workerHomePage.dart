import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Assume that we have a Firestore collection called 'users'
// and each document in this collection has a field called 'userId'
// that contains the user's ID, and a field called 'name' that
// contains the user's name.

final userId = FirebaseAuth.instance.currentUser!.uid;

class WorkerPage extends StatefulWidget {
  const WorkerPage({super.key});

  @override
  State<WorkerPage> createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  bool isConfirmed = false;
  String confirm = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: getUserDocumentSnapshot(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              var userData = snapshot.data!.data() as Map<String, dynamic>;

              return FutureBuilder(
                future: getUserDocument(userData['Role']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    } else {
                      var orderData =
                          snapshot.data!.data() as Map<String, dynamic>;

                      List order = orderData['order'];
                      return ListView.builder(
                        itemCount: order.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 2),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Order ID:uh1827dh837hdwu",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Customer Name: Saroj Chhetri",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Customer Phone Number: ${order[index]['phoneNumber']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Location : ${order[index]['location']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Payment Status: ${order[index]['paymentStatus']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Payment Amount: ${order[index]['paymentAmount']}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  isConfirmed
                                      ? Center(
                                          child: const Text(
                                              "Your order has been Confirmed"),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isConfirmed = true;
                                                    confirm = "Confirmed";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: const Center(
                                                      child: Text(
                                                    "Confirm",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isConfirmed = false;
                                                    confirm = "Cancelled";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 150,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: const Center(
                                                      child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Text("");
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// Function for getting user document to get user id
Future<DocumentSnapshot> getUserDocumentSnapshot(String userId) async {
  // Get a reference to the Firestore collection
  CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Worker Details');

  // Query the collection for documents where the 'userId' field is equal to the given ID
  QuerySnapshot querySnapshot =
      await usersRef.where('Id', isEqualTo: userId).get();

  // Check if there are any documents in the query snapshot
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first matching document and return its snapshot
    return querySnapshot.docs.first;
  } else {
    // No matching document found
    throw Exception('No Work Available for you');
  }
}

// Function for getting job role of worker
Future<DocumentSnapshot> getUserDocument(String jobRole) async {
  // Get a reference to the Firestore collection
  CollectionReference usersRef = FirebaseFirestore.instance.collection(jobRole);

  // Query the collection for documents where the 'userId' field is equal to the given ID
  QuerySnapshot querySnapshot =
      await usersRef.where('Id', isEqualTo: userId).get();

  // Check if there are any documents in the query snapshot
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first matching document and return its snapshot
    return querySnapshot.docs.first;
  } else {
    // No matching document found
    throw Exception('No Work Available for you');
  }
}
