// import 'package:api_call/API_WORK/cricket_page.dart';
import 'package:flutter/material.dart';

// import 'API_WORK/main_page_api.dart';
import 'bitcoin_work/bitcoin_rates_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BitcoinMainPage(),
      // MainPageApi(),
      // CricketPage(),
    );
  }
}
