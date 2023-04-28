import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online/customer/paymentPage.dart';
import 'package:online/customer/viewReviewPage.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class WorkerList extends StatefulWidget {
  final String workerType;
  final String location;
  WorkerList({
    required this.workerType,
    required this.location,
  });

  @override
  State<WorkerList> createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final student =
        FirebaseFirestore.instance.collection(widget.workerType).get();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workerType),
      ),
      body: FutureBuilder<QuerySnapshot>(
        //Fetching data from the documentId specified of the student
        future: student,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //Error Handling conditions
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData) {
            return Column(
              children: [
                SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
                Expanded(
                  child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                              )
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data['FirstName'] ?? "",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => PaymentMethod(
                                          jobRole: widget.workerType,
                                          location: widget.location,
                                          phoneNumber:
                                              data['Phone Number'] ?? "",
                                          docId: data['Id'] ?? "",
                                          workerName: data['FirstName'] ?? "",
                                        ));
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        "Order",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => ViewReviewPage(
                                          reviewDetails: data['review'] ?? [],
                                          experience: data['experience'] ?? "",
                                          location: data['Location'] ?? "",
                                          name: data['FirstName'] ?? "",
                                          phoneNumber:
                                              data['Phone Number'] ?? "",
                                          ratings: data['ratings'] ?? "",
                                          workerId: data['Id'],
                                        ));
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        "View details",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList()),
                ),
              ],
            );
          }

          //Data is output to the user

          return Text("loading");
        },
      ),
    );
  }
}
