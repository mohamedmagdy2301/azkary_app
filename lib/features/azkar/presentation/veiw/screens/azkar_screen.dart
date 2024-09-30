import 'package:azkary_app/features/azkar/presentation/veiw/widgets/appbar_azkar.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/azkar_screen_body.dart';
import 'package:flutter/material.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  static const String routeName = "/azkarScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarAzkar(),
      body: AzkarScreenBody(),
    );
  }
}
