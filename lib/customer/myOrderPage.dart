import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online/customer/addReview.dart';

// Assume that we have a Firestore collection called 'users'
// and each document in this collection has a field called 'userId'
// that contains the user's ID, and a field called 'name' that
// contains the user's name.

final userId = FirebaseAuth.instance.currentUser!.uid;

class UserPage extends StatelessWidget {
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

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 2),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Worker Name: ${userData['workerName']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Worker Location: ${userData['workerLocation']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Phone Number: ${userData['phoneNumber']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Amount: ${userData['totalAmount']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Payment Status: Completed",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Review(
                                  uid: userData['workerId'],
                                ));
                          },
                          child: Container(
                            height: 40,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Center(
                                child: Text(
                              "Add Review",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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

Future<DocumentSnapshot> getUserDocumentSnapshot(String userId) async {
  // Get a reference to the Firestore collection
  CollectionReference usersRef = FirebaseFirestore.instance.collection('Order');

  // Query the collection for documents where the 'userId' field is equal to the given ID
  QuerySnapshot querySnapshot =
      await usersRef.where('userId', isEqualTo: userId).get();

  // Check if there are any documents in the query snapshot
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first matching document and return its snapshot
    return querySnapshot.docs.first;
  } else {
    // No matching document found
    throw Exception('You have no orders');
  }
}
