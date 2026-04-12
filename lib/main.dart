import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/providers/menu_provider.dart';
import 'package:swiggy_clone/views/home_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: const ZomatoApp(),
    ),
  );
}

class ZomatoApp extends StatelessWidget {
  const ZomatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zomato Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeView(),
    );
  }
}
