import 'package:azkary_app/features/azkar/data/azkar_data.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:flutter/material.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key});
  static const String routeName = '/azkarDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final azkarScreenBodyItemModel =
        ModalRoute.of(context)?.settings.arguments as AzkarScreenBodyItemModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(azkarScreenBodyItemModel.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: azkarData["أذكار الصباح"]?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(azkarData["أذكار الصباح"]?[index]['content'] ?? ""),
            );
          },
        ),
      ),
    );
  }
}
