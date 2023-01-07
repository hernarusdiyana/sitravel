import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddEventController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addEvent(String name, int price) async {
    CollectionReference events = firestore.collection("events");

    try {
      await events.add({
        "name": name,
        "price": price,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan event",
        onConfirm: () => Get.back(),
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menambahkan event",
      );
    }
  }

  // @override
  // Void onInit() {
  //   nameC = TextEditingController();
  //   priceC = TextEditingController();
  //   super.onInit();
  // }
  // @override
  // Void onClose() {
  //   nameC.dispose();
  //   priceC.dispose();
  //   super.onClose();
  // }
}
