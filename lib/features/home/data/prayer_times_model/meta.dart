import 'method.dart';
import 'offset.dart';

class Meta {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final Method? method;
  final String? latitudeAdjustmentMethod;
  final String? midnightMode;
  final String? school;
  final Offset? offset;

  const Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        timezone: json['timezone'] as String?,
        method: json['method'] == null
            ? null
            : Method.fromJson(json['method'] as Map<String, dynamic>),
        latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
        midnightMode: json['midnightMode'] as String?,
        school: json['school'] as String?,
        offset: json['offset'] == null
            ? null
            : Offset.fromJson(json['offset'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'timezone': timezone,
        'method': method?.toJson(),
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
        'midnightMode': midnightMode,
        'school': school,
        'offset': offset?.toJson(),
      };
}
