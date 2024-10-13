import 'package:azkary_app/features/home/data/prayer_times_model/prayer_times_model.dart';
import 'package:azkary_app/features/home/domain/prayer_times_entity.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class PrayerTimesRepository {
  Dio dio = Dio();

  static Map<String, String> timings = {};
  Future<List<PrayerTimesEntity>> fetchPrayerTimes(
      {required Position location}) async {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    const String apiUrl = 'https://api.aladhan.com/v1/timings/';
    String latitude = location.latitude.toString();
    String longitude = location.longitude.toString();
    const String method = '5';
    List<PrayerTimesEntity> dataListInfo = [];
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    Response response = await dio.get(
      '$apiUrl$formattedDate?latitude=$latitude&longitude=$longitude&method=$method',
    );
    Map<String, dynamic> data = response.data;
    timings = Map<String, String>.from(data['data']['timings']);
    var result = data['data'];
    dataListInfo.add(PrayerTimesModel.fromJson(result));
    return dataListInfo;
  }
}
// https://api.aladhan.com/v1/timings/2022-11-11?latitude=30.5632921&longitude=30.9970544&method=5
