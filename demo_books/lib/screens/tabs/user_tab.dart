import 'package:demo_books/widgets/lottie_animation.dart';
import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        SizedBox(
          width: size.width,
        ),
        const DemoWidget(),
      ]),
    );
  }
}
