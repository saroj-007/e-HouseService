import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:online/customer/homePage.dart';
import 'package:online/customer/mainPage.dart';
import 'package:online/provider/orderProvider.dart';

class Review extends StatefulWidget {
  Review({super.key, required this.uid});
  // String jobRole;
  String uid;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  double ratings = 0;
  final commentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF990009),
              )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: const Color(0xffE6E6E6),
                radius: 50,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                  size: 52,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: ratings,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      ratings = rating;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                "${ratings.toString()}/5.0",
                style: const TextStyle(fontSize: 20),
              )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: commentsController,
                    decoration: InputDecoration(
                        hintText: "Write your review",
                        suffixIcon: InkWell(
                            onTap: () async {
                              print(widget.uid);
                              ref.read(orderProvider).postReview(
                                  // jobRole: widget.jobRole,
                                  docId: widget.uid,
                                  review: commentsController.text.trim(),
                                  ratings: ratings);
                              Get.to(() => MainPage(
                                    index: 0,
                                  ));
                            },
                            child: const Icon(Icons.send,
                                color: Color(0xFF990009)))),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
