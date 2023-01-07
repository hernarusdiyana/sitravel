import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sitravel_app/add/add_event.dart';
import 'package:sitravel_app/booked/main_booked_page.dart';
import 'package:sitravel_app/event/detail_package.dart';
import 'package:sitravel_app/event/detail_page.dart';
import 'package:sitravel_app/event/main_event.dart';
import 'package:sitravel_app/home/main_travel_page%20copy.dart';
import 'package:sitravel_app/order/customer_data.dart';
import 'package:sitravel_app/order/order_detail.dart';
import 'package:sitravel_app/order/ordering_page.dart';
import 'package:sitravel_app/pages/choose_location.dart';
import 'package:sitravel_app/pages/login_page.dart';
import 'package:sitravel_app/pages/register_screen.dart';
import 'package:sitravel_app/profile/profile_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(title: 'Si Paling Travel'),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => MainTravelPage(),
        '/booked': (context) => MainBookedPage(),
        '/profile': (context) => ProfilePage(),
        '/addEvent': (context) => AddEvent(),
        '/chooseLocation': (context) => ChooseLocation(),
        '/event': (context) => MainEventPage(),
        '/detailPage': (context) => DetailPage(),
        '/detailPackage': (context) => DetailPackage(),
        '/order': (context) => OrderingPage(),
        '/customerData': (context) => CustomerData(),
        '/orderDetail': (context) => OrderDetail(),
      },
    );
  }
}
