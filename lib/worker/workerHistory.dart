import 'package:flutter/material.dart';

class WorkerHistory extends StatefulWidget {
  const WorkerHistory({super.key});

  @override
  State<WorkerHistory> createState() => _WorkerHistoryState();
}

class _WorkerHistoryState extends State<WorkerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("History"),
        ),
        body: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 2),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Order ID: uh1827dh837hdwu",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Date:2022/04/30",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Name: Saroj Chhetri",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Phone Number: 9860235680",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Location: Amphitheatre Parkway, , Mountain View, California, 94043, United States",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Phone Number: 9862243661",
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ]));
  }
}
