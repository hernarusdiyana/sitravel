import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sitravel_app/booked/main_booked_page.dart';
import 'package:sitravel_app/colors.dart';
// import 'package:sitravel_app/book/main_book_page.dart';
import 'package:sitravel_app/pages/main_saved_page.dart';
import '../home/main_travel_page.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.0,
      // color: Colors.red,
      child: CurvedNavigationBar(
        color: AppColors.mainColor,
        key: _bottomNavigationKey,
        index: 0,

        items: <Widget>[
          bottomItem(
              title: "Home",
              index: 0,
              icon: Icons.home,
              press: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainTravelPage(),
                  ),
                );
              }),
          bottomItem(
              title: "Simpanan",
              index: 1,
              icon: Icons.favorite_border,
              press: () async {
                Navigator.pushNamed(context, '/booked');
              }),
          bottomItem(
            title: "Bookingan",
            index: 2,
            icon: Icons.history,
            press: () {},
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },

        letIndexChange: (index) => true,
        height: 70.0,
        buttonBackgroundColor: Colors.white,
        backgroundColor: AppColors.tealColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        // animationCurve: ,
      ),
      //     body: Container(
      //         color: Colors.blue,
      //         width: double.infinity,
      //         height: double.infinity,
      //         alignment: Alignment.center,
      //         child: getSelectedWidget(index: index)),
      //   ),
      // );
    );
  }

  Widget bottomItem({
    required int index,
    required String title,
    required IconData icon,
    required Function press,
  }) {
    if (index == _page) {
      return Icon(
        icon,
        size: 26,
        color: AppColors.mainColor,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      );
    }
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const MainTravelPage();
      break;
    case 1:
      widget = const MainSavedPage();
      break;
    default:
      widget = const MainBookedPage();
      break;
  }
  return widget;
}



// class BottomNavbar extends StatelessWidget {
//   const BottomNavbar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//       height: 70,
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           BottomNavItem(
//             svgScr: "assets/icons/home.svg",
//             title: "Home",
//             press: () {},
//             isActive: true,
//           ),
//           BottomNavItem(
//             svgScr: "assets/icons/bookmark.svg",
//             title: "Home",
//             press: () {},
//           ),
//           BottomNavItem(
//             svgScr: "assets/icons/ticket.svg",
//             title: "Home",
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
