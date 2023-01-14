import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitravel_app/application_state.dart';
import 'package:sitravel_app/colors.dart';
import 'package:sitravel_app/event/main_event.dart';
import 'package:sitravel_app/pages/login_page.dart';
import 'package:sitravel_app/widgets/big_text.dart';
import 'package:sitravel_app/widgets/icon_text_widget.dart';
import 'package:sitravel_app/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider;
import 'package:provider/provider.dart';
import '../widgets/menu_card.dart';

class TravelPageBody extends StatefulWidget {
  const TravelPageBody({
    super.key,
    required this.addEvents,
    required this.events,
  });
  final FutureOr<void> Function(String event) addEvents;
  final List<GetDataEvent> events;

  @override
  State<TravelPageBody> createState() => _TravelPageBodyState();
}

class _TravelPageBodyState extends State<TravelPageBody> {
  String username = "";
  String email = "";

  final _formKey = GlobalKey<FormState>(debugLabel: '_GetDataEvent');
  final _controller = TextEditingController();
  String? name;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    getPref();
    _getData();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin == true) {
      setState(() {
        email = pref.getString("email")!;
      });
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  StreamSubscription<QuerySnapshot>? _getDataEvent;
  List<GetDataEvent> _getDataEvents = [];
  List<GetDataEvent> get getDataEvents => _getDataEvents;

  Future _getData() async {
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
              // notifyListeners();
            });
      } else {
        _loggedIn = false;
        _getDataEvents = [];
        _getDataEvent?.cancel();
      }
      // notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          // color: Colors.red,
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Recomended Text
        SizedBox(
          height: 20,
        ),

        Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: BigText(
            text: "Rekomendasi Makanan",
            color: Colors.black,
          ),
        ),

        //List of Travel and Images
        Container(
          height: 1000,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //       color: Color(0xFFE8E8E8),
            //       blurRadius: 5.0,
            //       offset: Offset(0, 5)),
            //   BoxShadow(
            //     color: Colors.white,
            //     offset: Offset(-5, 0),
            //   ),
            //   BoxShadow(
            //     color: Colors.white,
            //     offset: Offset(5, 0),
            //   ),
            // ],
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 140,
                  // color: Color.fromRGBO(255, 193, 7, 0.5),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      // Image Section
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //     topLeft: Radius.circular(20),
                            //     bottomLeft: Radius.circular(20)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/travel1.jpg"))),
                      ),

                      // Text Section
                      Expanded(
                        child: Container(
                          height: 120,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: '${name}',
                                  color: Colors.black,
                                ),
                                SizedBox(height: 14),
                                SmallText(
                                  text: " ipsum sir dolor amet",
                                  color: Colors.black54,
                                ),
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconTextWidget(
                                        icon: Icons.location_on,
                                        text: "Ubud, Bali",
                                        color: AppColors.mainColor,
                                        iconColor: AppColors.mainColor),
                                    IconTextWidget(
                                        icon: Icons.price_change,
                                        text: "100.000",
                                        color: AppColors.mainColor,
                                        iconColor: AppColors.mainColor)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69CFBF) : Color(0xFF9294CC),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/travel1.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFE8E8E8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Labuan Bajo",
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 14,
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SmallText(
                          text: "5",
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                          icon: Icons.location_on,
                          text: "Gelora Bung Karno",
                          color: Colors.black38,
                          iconColor: AppColors.mainColor,
                        ),
                        IconTextWidget(
                          icon: Icons.price_change_rounded,
                          text: "200.000",
                          color: Colors.black38,
                          iconColor: AppColors.mainColor,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
