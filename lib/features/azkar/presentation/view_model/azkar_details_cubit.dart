import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsState {
  final List<Map<String, String>>? dataList;
  final List<int> counters;

  AzkarDetailsState({
    required this.dataList,
    required this.counters,
  });

  AzkarDetailsState copyWith({
    List<Map<String, String>>? dataList,
    List<int>? counters,
  }) {
    return AzkarDetailsState(
      dataList: dataList ?? this.dataList,
      counters: counters ?? this.counters,
    );
  }
}

class AzkarDetailsCubit extends Cubit<AzkarDetailsState> {
  AzkarDetailsCubit(List<Map<String, String>>? dataList)
      : super(AzkarDetailsState(
          dataList: dataList,
          counters: List<int>.filled(dataList?.length ?? 0, 0),
        ));

  // Method to increment the counter for a specific index
  void incrementCounter(int index) {
    final currentCounters = List<int>.from(state.counters);
    if (currentCounters[index] <
        int.parse(state.dataList?[index]["count"] ?? "0")) {
      currentCounters[index]++;
      emit(state.copyWith(counters: currentCounters));
    }
  }
}
