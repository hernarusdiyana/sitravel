import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sitravel_app/widgets/big_text.dart';

class MainBookedPage extends StatefulWidget {
  const MainBookedPage({super.key});

  @override
  State<MainBookedPage> createState() => _MainBookedPageState();
}

class _MainBookedPageState extends State<MainBookedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'Simpanan'),
      ),
    );
  }
}
