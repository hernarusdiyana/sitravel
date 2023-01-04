import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sitravel_app/home/travel_page_body.dart';
import 'package:sitravel_app/widgets/big_text.dart';

// import '../bricks/bottom_navbar.dart';
import '../colors.dart';
import '../widgets/bottom_navbar.dart';
// import 'package:sitravel_app/book/main_book_page.dart';
import 'package:sitravel_app/pages/main_saved_page.dart';

class MainSavedPage extends StatefulWidget {
  const MainSavedPage({super.key});

  @override
  State<MainSavedPage> createState() => _MainSavedPageState();
}

class _MainSavedPageState extends State<MainSavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Simpanan",
                        color: AppColors.mainColor,
                        size: 22,
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      "assets/icons/user.svg",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView()),
        ],
      ),
    );
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
