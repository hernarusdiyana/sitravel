import 'dart:async';                                     // new
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'        // new
    hide EmailAuthProvider, PhoneAuthProvider;           // new
import 'package:firebase_core/firebase_core.dart';       // new
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; // new
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';                 // new
import 'event/main_event.dart';
// import 'firebase_options.dart';                          // new
// import 'src/authentication.dart';                        // new
// import 'src/widgets.dart';
class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  StreamSubscription<QuerySnapshot>? _getDataEvent;
  List<GetDataEvent> _getDataEvents = [];
  List<GetDataEvent> get getDataEvents => _getDataEvents;

    Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
    
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        _getDataEvent = FirebaseFirestore.instance
            .collection('events')
            .orderBy('timestamp', descending: true)
            .where('cat_location', arrayContainsAny: ['Bali'])
            .snapshots()
            .listen((snapshot) {
          _getDataEvents = [];
          for (final document in snapshot.docs) {
            _getDataEvents.add(
              GetDataEvent(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
              ),
            );
          }
          notifyListeners();
        });
      } else {
        _loggedIn = false;
        _getDataEvents = [];
        _getDataEvent?.cancel();
      }
      notifyListeners();
    });
  }
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}