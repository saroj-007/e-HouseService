import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewReviewPage extends StatelessWidget {
  ViewReviewPage(
      {super.key,
      required this.reviewDetails,
      required this.name,
      required this.location,
      required this.phoneNumber,
      required this.ratings,
      required this.experience,
      required this.workerId});
  List reviewDetails;
  String name;
  String location;
  String phoneNumber;
  String ratings;
  String workerId;
  String experience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 2),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Worker Details",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Name: $name",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Phone Number: $phoneNumber",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Location : $location",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Experience: $experience ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              FutureBuilder<DocumentSnapshot>(
                  future: getUserDocumentSnapshot(workerId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      } else {
                        var userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Review: ${userData['Ratings']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Review: ${userData['review']}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      }
                    } else {
                      return Text("Loading");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Future<DocumentSnapshot> getUserDocumentSnapshot(String workerId) async {
  // Get a reference to the Firestore collection
  CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Review');

  // Query the collection for documents where the 'userId' field is equal to the given ID
  QuerySnapshot querySnapshot =
      await usersRef.where('workerId', isEqualTo: workerId).get();

  // Check if there are any documents in the query snapshot
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first matching document and return its snapshot
    return querySnapshot.docs.first;
  } else {
    // No matching document found
    throw Exception('No reviews');
  }
}
