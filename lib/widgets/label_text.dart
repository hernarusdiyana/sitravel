import 'package:flutter/cupertino.dart';

class LabelText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;
  // TextOverflow overflow;

  LabelText({
    super.key,
    this.color = const Color(0x005D5D5D),
    required this.text,
    this.size = 14,
    this.height = 1.2,
    // this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      // overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontSize: size,
        height: height,
      ),
    );
  }
}
