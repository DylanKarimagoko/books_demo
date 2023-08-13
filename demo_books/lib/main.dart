import 'package:demo_books/screens/dashboard.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: Styles.kantumruyRegular,
        colorScheme: ColorScheme.fromSeed(seedColor: Styles.secondaryWhite),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
