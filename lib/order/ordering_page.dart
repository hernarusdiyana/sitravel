import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/components/rounded_button.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/label_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'customer_data.dart';

class OrderingPage extends StatefulWidget {
  const OrderingPage({super.key});

  @override
  State<OrderingPage> createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.mainColor,
        title: BigText(
          text: "Pemesanan",
          color: AppColors.mainColor,
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CustomerData())));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              fixedSize: const Size(240, 40),
            ),
            child: Text(
              "Isi Data Pemesan >",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.lightColor,
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BigText(text: "Bismillah Bali", color: AppColors.mainColor),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      "Premium",
                      style: TextStyle(
                          color: AppColors.lightColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 2),
                Container(
                  // margin: EdgeInsets.only(bottom: 20),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      new TextSpan(
                        text: "Ubud, Bali",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = (() async {
                            final url = 'https://goo.gl/maps/mu5nYde4VXrRZZmH6';
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }),
                      ),
                    ]),
                  ),
                )
              ]),
              SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Harga Tiket",
                        color: Colors.black54,
                      ),
                      SizedBox(height: 10),
                      BigText(
                        text: "IDR 1.350.000",
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Jumlah Tiket",
                        color: Colors.black54,
                      ),
                      SizedBox(height: 10),
                      // NumberInputPrefabbed.roundedEdgeButtons(
                      //   controller: TextEditingController(),
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 22, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Detail Order",
                color: Colors.black,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BigText(text: "Bismillah Bali", color: AppColors.mainColor),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
                        child: Text(
                          "Pemesan",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      LabelText(
                        text: "4x",
                        color: Colors.black54,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.location_on_outlined),
                SizedBox(width: 2),
                Container(
                  // margin: EdgeInsets.only(bottom: 20),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: [
                      new TextSpan(
                        text: "Ubud, Bali",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = (() async {
                            final url = 'https://goo.gl/maps/mu5nYde4VXrRZZmH6';
                            await launch(
                              url,
                              forceSafariVC: false,
                            );
                          }),
                      ),
                    ]),
                  ),
                )
              ]),
              SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Tanggal Event",
                        color: Colors.black54,
                      ),
                      SizedBox(height: 10),
                      BigText(
                        text: "Sabtu, 11 Maret 2023",
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Total Harga",
                        color: Colors.black54,
                      ),
                      SizedBox(height: 10),
                      BigText(
                        text: "IDR 10.000.000",
                        color: Colors.black,
                        size: 16,
                        weight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
