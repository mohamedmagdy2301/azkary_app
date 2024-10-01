import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Cubit Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
