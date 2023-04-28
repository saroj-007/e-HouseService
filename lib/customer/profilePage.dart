import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online/loginPage.dart';
import 'package:online/provider/authProvider.dart';

final uid = FirebaseAuth.instance.currentUser!.uid;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer(builder: (context, ref, child) {
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('userDetails')
                  .doc(uid) //ID OF DOCUMENT
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var document = snapshot.data;
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.verified),
                      title: const Text("FullName"),
                      trailing: Text("${document!["FirstName"]}"),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text("Email"),
                      trailing: Text("${document["email"]}"),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        Get.to(() => LoginPage());
                      },
                      child: const ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Logout"),
                          trailing: Icon(Icons.logout)),
                    ),
                    const Divider(),
                  ],
                );
              });
        }));
  }
}
