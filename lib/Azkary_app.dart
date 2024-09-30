import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/home/presentation/veiw/screens/home_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// fake commit

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.color, required this.isdebug});
  final Color color;
  final bool isdebug;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: isdebug,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: color),
      ),
      home: const NavBarMainApp(),
    );
  }
}

class NavBarMainApp extends StatefulWidget {
  const NavBarMainApp({
    super.key,
  });

  @override
  State<NavBarMainApp> createState() => _NavBarMainAppState();
}

class _NavBarMainAppState extends State<NavBarMainApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItem,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  List<Widget> bodyScreens = [
    const HomeScreen(),
    const SabhaScreen(),
    const AzkarScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.house,
        color: Color(0xff8DA05E),
      ),
      activeIcon: Icon(
        CupertinoIcons.house_fill,
        color: Color(0xff8DA05E),
      ),
      label: ' ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.book,
        color: Color(0xff8DA05E),
      ),
      activeIcon: Icon(
        CupertinoIcons.book_fill,
        color: Color(0xff8DA05E),
      ),
      label: ' ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.gear_alt,
        color: Color(0xff8DA05E),
      ),
      activeIcon: Icon(
        CupertinoIcons.gear_alt_fill,
        color: Color(0xff8DA05E),
      ),
      label: ' ',
    ),
  ];
}
