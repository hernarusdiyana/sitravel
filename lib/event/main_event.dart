import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/event/travel_page_body.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/notification_widget.dart';

class MainEventPage extends StatefulWidget {
  const MainEventPage({super.key});

  @override
  State<MainEventPage> createState() => _MainEventPageState();
}

class GetDataEvent {
  GetDataEvent({required this.name, required this.message});
  final String name;
  final String message;
}

class _MainEventPageState extends State<MainEventPage> {
  StreamSubscription<QuerySnapshot>? _getDataEvent;
  List<GetDataEvent> _getDataEvents = [];
  List<GetDataEvent> get getDataEvents => _getDataEvents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightColor,
        elevation: 0,
        foregroundColor: AppColors.mainColor,
        title: BigText(
          text: "Event",
          color: AppColors.mainColor,
        ),
        actions: [],
      ),
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: AppColors.lightColor,

      // body: SingleChildScrollView(
      //   child: TravelPageBody(),
      // ),
      body: SingleChildScrollView(
          child: FutureBuilder<FirebaseApp>(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return TravelPageBody(
                    documentId: '',
                    addEvents: (String event) {},
                    events: [],
                  );
                }
                return WidgetNotification(
                    message: "Tidak dapat terhubung dengan Firebase !!");
              })),
    );
  }
}
