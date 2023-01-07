import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/add/add_event_controller.dart';

class AddEvent extends StatelessWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var controller;
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Add Event",
          color: AppColors.mainColor,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.nameC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Product Name",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.priceC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Price",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.addProduct(
                controller.nameC.text, controller.priceC.text),
            child: BigText(
              text: "Add Product",
            ),
          ),
        ],
      ),
    );
  }
}
