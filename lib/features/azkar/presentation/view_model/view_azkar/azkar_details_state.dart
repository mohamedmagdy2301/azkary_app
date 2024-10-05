class AzkarDetailsState {
  final List<Map<String, String>>? dataList;
  final List<dynamic> counters;

  AzkarDetailsState({
    required this.dataList,
    required this.counters,
  });

  AzkarDetailsState copyWith({
    List<Map<String, String>>? dataList,
    List<dynamic>? counters,
  }) {
    return AzkarDetailsState(
      dataList: dataList ?? this.dataList,
      counters: counters ?? this.counters,
    );
  }
}
