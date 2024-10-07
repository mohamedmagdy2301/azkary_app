import 'package:azkary_app/features/home/data/prayer_times_model/prayer_times_model.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:dio/dio.dart';

class PrayerTimesRepository {
  Dio dio = Dio();
  static Map<String, String> timings = {};
  Future<List<PrayerTimesEntity>> fetchPrayerTimes() async {
    const String apiUrl = 'https://api.aladhan.com/v1/timings';
    const String latitude = '30.5632921';
    const String longitude = '30.9970544';
    const String method = '5';
    List<PrayerTimesEntity> dataListInfo = [];
    Response response = await dio.get(
      '$apiUrl?latitude=$latitude&longitude=$longitude&method=$method',
    );
    Map<String, dynamic> data = response.data;
    timings = Map<String, String>.from(data['data']['timings']);
    var result = data['data'];
    dataListInfo.add(PrayerTimesModel.fromJson(result));
    return dataListInfo;
  }
}
