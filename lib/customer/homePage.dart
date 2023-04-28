import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online/customer/workerList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  String locationData = "";
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    String data = sharedPrefs.getString("Location") ?? "No Address found";
    setState(() {
      locationData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Home eService",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                Flexible(
                  child: Text(
                    locationData,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Cleaner",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset("asset/cleaner.png"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Cleaner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Plumber",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/plumber.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Plumber",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Gardener",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/gardener.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Gardener",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Carpenter",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/carpenter.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Carpenter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Electrician",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/electrician.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Electrician",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WorkerList(
                            workerType: "Painter",
                            location: locationData,
                          ));
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            color: Colors.grey,
                            offset: Offset(0.75, 0.75))
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/painter.png")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Painter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
