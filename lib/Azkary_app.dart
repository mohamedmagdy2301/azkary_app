import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required this.title,
      required this.color,
      required this.isdebug});
  final String title;
  final Color color;
  final bool isdebug;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: isdebug,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: color),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(
            "Width: ${MediaQuery.of(context).size.width}\nHeight: ${MediaQuery.of(context).size.height}",
          ),
        ),
      ),
    );
  }
}
