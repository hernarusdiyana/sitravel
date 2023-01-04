import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sitravel_app/event/main_event.dart';
import 'package:sitravel_app/event/main_event.dart';
import 'package:sitravel_app/home/main_travel_page%20copy.dart';
import 'package:sitravel_app/home/travel_page_body.dart';
import 'package:sitravel_app/pages/splash_screen.dart';
import 'package:sitravel_app/profile/profile_page.dart';
import 'package:sitravel_app/widgets/big_text.dart';

import '../widgets/menu_card.dart';
import '../widgets/bottom_navbar.dart';
import '../colors.dart';
// import '../widgets/bottom_navbar.dart';

class MainTravelPage extends StatefulWidget {
  const MainTravelPage({super.key});

  @override
  State<MainTravelPage> createState() => _MainTravelPageState();
}

class _MainTravelPageState extends State<MainTravelPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/mainTravel': (context) => MainTravelPage(),
          // '/hotel': (context) => MainHotelPage(),
          // '/wisata': (context) => MainWisataPage(),
          '/event': (context) => MainEventPage(),
          // '/kuliner': (context) => MainKulinerPage(),
        },
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
        ),
        home: Scaffold(
          bottomNavigationBar: BottomNavBar(),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(10, 32, 84, 1),
            elevation: 0,
            title: const Text(
              'SiTravel',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Color.fromARGB(126, 27, 56, 122),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/user.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: BottomNavBar(),
          backgroundColor: AppColors.lightColor,
          body: Stack(
            children: <Widget>[
              Container(
                height: size.height * .35,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(10, 32, 84, 1),
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage("assets/images/banner1.jpg"),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Mau ngapain hari ini?",
                              icon: SvgPicture.asset("assets/icons/user.svg"),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .90,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(10, 32, 84, 1),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 17,
                                      spreadRadius: -24,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Spacer(),
                                            Image.asset(
                                              "assets/icons/hotel.png",
                                              height: 70,
                                            ),
                                            Spacer(),
                                            Text(
                                              "Hotel",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                              // style: Theme.of(context).textTheme.titleLarge,
                                              // selectionColor: kTextColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        print("Tapped!!!");
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             new MainBookPage()));
                                      }),
                                ),
                              ),
                            ),
                            // MenuCard(
                            //   title: "Hotel",
                            //   svgSrc: "assets/icons/hotel.png",
                            //   press: () {
                            //     print("Tapped!!!");
                            //     // Navigator.of(context).pushReplacement(
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) =>
                            //     //             new MainBookPage()));
                            //   },
                            // ),
                            MenuCard(
                              title: "Wisata",
                              svgSrc: "assets/icons/wisata.png",
                              press: () {},
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: Container(
                                // padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(10, 32, 84, 1),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 17,
                                      spreadRadius: -24,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: <Widget>[
                                            Spacer(),
                                            Image.asset(
                                              "assets/icons/event.png",
                                              height: 70,
                                            ),
                                            Spacer(),
                                            Text(
                                              "Event",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                              // style: Theme.of(context).textTheme.titleLarge,
                                              // selectionColor: kTextColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainEventPage()));
                                      }),
                                ),
                              ),
                            ),

                            MenuCard(
                              title: "Kuliner",
                              svgSrc: "assets/icons/kuliner.png",
                              press: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr, color: Color.fromRGBO(10, 32, 84, 1),
            // color: isActive ? kActiveIconColor : kTextColor,
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const MenuCard({
    super.key,
    required this.svgSrc,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(10, 32, 84, 1),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 17,
              spreadRadius: -24,
              color: Colors.black,
            ),
          ],
        ),
        child: Container(
          color: Colors.transparent,
          child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Image.asset(
                      svgSrc,
                      height: 70,
                    ),
                    Spacer(),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      // style: Theme.of(context).textTheme.titleLarge,
                      // selectionColor: kTextColor,
                    )
                  ],
                ),
              ),
              onTap: press()),
        ),
      ),
    );
  }
}
