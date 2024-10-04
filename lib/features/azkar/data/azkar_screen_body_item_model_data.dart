import 'package:azkary_app/core/utils/strings.dart';

class AzkarScreenBodyItemModel {
  final String title, image;
  final int id;

  AzkarScreenBodyItemModel({
    required this.title,
    required this.image,
    required this.id,
  });
}

List<AzkarScreenBodyItemModel> azkarScreenBodyItemModel = [
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlsabah,
    image: "assets/images/1.jpg",
    id: 0,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlmasaa,
    image: "assets/images/2.jpg",
    id: 1,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.tsabha,
    image: "assets/images/9.jpg",
    id: 2,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlIstikhaz,
    image: "assets/images/5.jpg",
    id: 3,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlslah,
    image: "assets/images/6.jpg",
    id: 4,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.azkarAlNoom,
    image: "assets/images/3.jpg",
    id: 5,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.adaiaAlnabiya,
    image: "assets/images/7.jpg",
    id: 6,
  ),
  AzkarScreenBodyItemModel(
    title: StringsAppAR.adaiaQarunia,
    image: "assets/images/4.jpg",
    id: 7,
  ),
];
