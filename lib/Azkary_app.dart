// ignore_for_file: file_names, library_private_types_in_public_api
// fake
import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
import 'package:azkary_app/features/settings/presentation/veiw/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const AzkarScreen(),
      const SabhaScreen(),
      const SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/crescent2.png',
          height: 30,
          width: 30,
        ),
        inactiveIcon: Image.asset(
          'assets/images/crescent.png',
          height: 30,
          width: 30,
        ),
        title: (" "),
        activeColorPrimary: ColorsAppLight.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/praying2.png',
          height: 35,
          width: 35,
        ),
        inactiveIcon: Image.asset(
          'assets/images/praying.png',
          height: 35,
          width: 35,
        ),
        title: (" "),
        activeColorPrimary: ColorsAppLight.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "assets/images/prayer-beads.png",
          height: 35,
          width: 35,
        ),
        inactiveIcon: Image.asset(
          'assets/images/arabic2.png',
          height: 35,
          width: 35,
        ),
        title: (" "),
        activeColorPrimary: ColorsAppLight.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/setting-bulb2.png',
          height: 30,
          width: 30,
        ),
        inactiveIcon: Image.asset(
          'assets/images/setting-bulb.png',
          height: 30,
          width: 30,
        ),
        title: (" "),
        activeColorPrimary: ColorsAppLight.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = context.watch<ThemeCubit>().state == ThemeMode.light;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 70.h,
      backgroundColor:
          isLightTheme ? Colors.white : ColorsAppDark.backgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      navBarStyle: NavBarStyle.style13,
      onWillPop: (context) async {
        return true;
      },
    );
  }
}
