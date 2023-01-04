import 'package:flutter/cupertino.dart';
import 'package:sitravel_app/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            width: 2,
          ),
          SmallText(
            text: text,
            color: color,
          )
        ],
      ),
    );
  }
}
