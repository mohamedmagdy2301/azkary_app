import 'package:azkary_app/features/azkar/data/azkar_data.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/azkar_details_liseview_item_card.dart';
import 'package:flutter/material.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key});
  static const String routeName = '/azkarDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final azkarScreenBodyItemModel =
        ModalRoute.of(context)?.settings.arguments as AzkarScreenBodyItemModel;
    var dataList = azkarData[azkarScreenBodyItemModel.title];
    return Scaffold(
      appBar: AppBar(
        title: Text(azkarScreenBodyItemModel.title),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: dataList?.length ?? 0,
        itemBuilder: (context, index) {
          return AzkarDetailsLiseviewItemCard(
            dataList: dataList,
            index: index,
          );
        },
      ),
    );
  }
}
