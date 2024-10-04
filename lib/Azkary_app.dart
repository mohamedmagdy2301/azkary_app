import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
import 'package:azkary_app/features/settings/presentation/veiw/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// fake commit

class NavBarMainApp extends StatefulWidget {
  const NavBarMainApp({
    super.key,
  });

  @override
  State<NavBarMainApp> createState() => _NavBarMainAppState();
}

class _NavBarMainAppState extends State<NavBarMainApp> {
  int _selectedIndex = 1;

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
    const SabhaScreen(),
    const AzkarScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.house),
      activeIcon: Icon(CupertinoIcons.house_fill),
      label: ' ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.book),
      activeIcon: Icon(CupertinoIcons.book_fill),
      label: ' ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.gear_alt),
      activeIcon: Icon(CupertinoIcons.gear_alt_fill),
      label: ' ',
    ),
    // const BottomNavigationBarItem(
    //   icon: Icon(CupertinoIcons.bell),
    //   activeIcon: Icon(CupertinoIcons.bell_fill),
    //   label: ' ',
    // ),
  ];
}
