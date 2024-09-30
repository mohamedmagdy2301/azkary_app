import 'package:azkary_app/features/azkar/presentation/veiw/widgets/appbar_azkar.dart';
import 'package:flutter/material.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarAzkar(),
      body: Center(
        child: Text('Azkar'),
      ),
    );
  }
}
