import 'package:azkary_app/core/utils/strings.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/azkar_screen_body_item.dart';
import 'package:flutter/material.dart';

class AzkarScreenBody extends StatefulWidget {
  const AzkarScreenBody({super.key});

  @override
  State<AzkarScreenBody> createState() => _AzkarScreenBodyState();
}

class _AzkarScreenBodyState extends State<AzkarScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[0],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[0],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[1],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[1],
                );
              },
            ),
            const Text(
              StringsAppAR.azkarMtnwa,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[2],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[2],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[3],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[3],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[4],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[4],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[5],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[5],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[6],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[6],
                );
              },
            ),
            AzkarScreenBodyItem(
              azkarScreenBodyItemModel: azkarScreenBodyItemModel[7],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AzkarDetailsScreen.routeName,
                  arguments: azkarScreenBodyItemModel[7],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
