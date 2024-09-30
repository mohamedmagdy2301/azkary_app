import 'package:azkary_app/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AppBarAzkar extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        StringsAppAR.alAzkar,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
