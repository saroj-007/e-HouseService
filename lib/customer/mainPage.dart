import 'package:flutter/material.dart';
import 'package:online/customer/homePage.dart';
import 'package:online/customer/myOrderPage.dart';
import 'package:online/customer/profilePage.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.index});
  int index;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  List pages = [const CustomerHomePage(), UserPage(), const ProfilePage()];
  int selectedItem = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedItem,
          onTap: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_repair_service), label: "My Orders"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
          ]),
      body: pages.elementAt(selectedItem),
    );
  }
}
