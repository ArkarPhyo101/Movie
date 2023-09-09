import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Backbutton extends StatelessWidget {
  const Backbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          
          margin: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ));
  }
}
