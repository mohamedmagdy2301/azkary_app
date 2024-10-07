class Offset {
  final int? imsak;
  final int? fajr;
  final int? sunrise;
  final int? dhuhr;
  final int? asr;
  final int? maghrib;
  final int? sunset;
  final int? isha;
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
        imsak: json['Imsak'] as int?,
        fajr: json['Fajr'] as int?,
        sunrise: json['Sunrise'] as int?,
        dhuhr: json['Dhuhr'] as int?,
        asr: json['Asr'] as int?,
        maghrib: json['Maghrib'] as int?,
        sunset: json['Sunset'] as int?,
        isha: json['Isha'] as int?,
        midnight: json['Midnight'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Imsak': imsak,
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Sunset': sunset,
        'Isha': isha,
        'Midnight': midnight,
      };

  @override
  List<Object?> get props {
    return [
      imsak,
      fajr,
      sunrise,
      dhuhr,
      asr,
      maghrib,
      sunset,
      isha,
      midnight,
    ];
  }
}
