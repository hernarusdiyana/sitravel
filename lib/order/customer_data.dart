import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/theme_helper.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/label_text.dart';

import 'order_detail.dart';

class CustomerData extends StatefulWidget {
  const CustomerData({super.key});

  @override
  State<CustomerData> createState() => _CustomerDataState();
}

class _CustomerDataState extends State<CustomerData> {
  TextEditingController emailController = TextEditingController(text: "");

  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String _errorMessage = '';
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.mainColor,
        title: BigText(
          text: "Data Pemesan",
          color: AppColors.mainColor,
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => OrderDetail())));
            },
            child: Text("Book Now"),
          ),
        ),
      ),
      backgroundColor: AppColors.lightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.lightColor,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    text: "Pemesan",
                    color: AppColors.textColor2,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: ThemeHelper()
                            .textInputDecoration('Nama', 'Masukkan Nama Anda'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: TextField(
                        decoration: ThemeHelper()
                            .textInputDecoration('Email', 'example@gmail.com'),
                        onChanged: (value) {
                          validateEmail(value);
                        },
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: TextField(
                        decoration: ThemeHelper()
                            .textInputDecoration('No. HP', 'No. Handphone'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: TextField(
                        decoration: ThemeHelper()
                            .textInputDecoration('NIK', 'Masukkan NIK Anda'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(
                          text: "Deskripsi (Optional)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      child: TextField(
                        decoration: ThemeHelper().textInputDecoration(
                            'Deskripsi', 'Isi bila pemesanan lebih dari 1'),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email tidak boleh kosong";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
