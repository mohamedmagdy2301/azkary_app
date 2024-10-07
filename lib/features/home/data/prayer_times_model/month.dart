class Month {
  final int? number;
  final String? en;
  final String? ar;

  const Month({this.number, this.en, this.ar});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json['ar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
        'ar': ar,
      };

  @override
  List<Object?> get props => [number, en, ar];
}
