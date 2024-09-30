import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/widgets/sabha_screen_body_circle.dart';
import 'package:flutter/material.dart';

class SabhaScreen extends StatefulWidget {
  const SabhaScreen({super.key});
  static const String routeName = '/sabha';

  @override
  State<SabhaScreen> createState() => _SabhaScreenState();
}

class _SabhaScreenState extends State<SabhaScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: SabhaScreenBodyCircle(counter: counter),
            ),
            const SizedBox(height: 70),
            IconButton(
              onPressed: () {
                setState(() {
                  counter = 0;
                });
              },
              icon: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 216, 216, 216),
                radius: 30,
                child: Icon(
                  Icons.replay,
                  size: 40,
                  color: ColorsAppLight.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
