import 'package:demo_books/widgets/lottie_animation.dart';
import 'package:flutter/material.dart';

class BookMarkTab extends StatefulWidget {
  const BookMarkTab({super.key});

  @override
  State<BookMarkTab> createState() => _BookMarkTabState();
}

class _BookMarkTabState extends State<BookMarkTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: size.width,
          ),
          const DemoWidget(),
        ],
      ),
    );
  }
}
