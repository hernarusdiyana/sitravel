import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:travel/constants.dart';
// import 'event.dart';

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
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
              onTap: press(),
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
              )),
        ),
      ),
    );
  }
}
