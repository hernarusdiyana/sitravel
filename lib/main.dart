import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'colors.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = Color(0xFF0A2054);
  Color _accentColor = Color(0xFF607EAA);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      title: 'SiTravel',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.mainColor,
        accentColor: AppColors.accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      home: SplashScreen(title: 'Si Paling Travel'),
      
    );
  }
}
