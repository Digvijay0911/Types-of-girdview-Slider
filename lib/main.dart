import 'package:flutter/material.dart';
import 'package:straggered_gridview_flutter/view/slider.dart';
import 'package:straggered_gridview_flutter/view/straggered_gridview_example.dart';

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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SliderScreen(),
    );
  }
}

