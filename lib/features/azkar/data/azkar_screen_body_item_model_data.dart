import 'package:azkary_app/core/utils/strings.dart';

class AzkarScreenBodyItemModel {
  final String title, image;

  AzkarScreenBodyItemModel({
    required this.title,
    required this.image,
  });
}

List<AzkarScreenBodyItemModel> azkarScreenBodyItemModel = [
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlsabah,
    image: "assets/images/1.jpg",
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlmasaa,
    image: "assets/images/2.jpg",
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarQayamAlLily,
    image: "assets/images/6.jpg",
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.alEsha,
    image: "assets/images/3.jpg",
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlNoom,
    image: "assets/images/5.jpg",
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarMtnwa,
    image: "assets/images/4.jpg",
  ),
];
