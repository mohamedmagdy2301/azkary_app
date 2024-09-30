import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:flutter/material.dart';

class AzkarScreenBodyItem extends StatelessWidget {
  const AzkarScreenBodyItem({
    super.key,
    required this.azkarScreenBodyItemModel,
    this.onTap,
  });
  final AzkarScreenBodyItemModel azkarScreenBodyItemModel;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          vertical: 9.5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(azkarScreenBodyItemModel.image),
            fit: BoxFit.fill,
            // opacity: 0.5,
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(122, 38, 38, 38),
              BlendMode.darken,
            ),
          ),
        ),
        child: Text(
          azkarScreenBodyItemModel.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
