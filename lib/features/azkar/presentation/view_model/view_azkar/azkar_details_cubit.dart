import 'package:azkary_app/core/local_storage/shared_preferences_manager.dart';
import 'package:azkary_app/features/azkar/presentation/view_model/view_azkar/azkar_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsCubit extends Cubit<AzkarDetailsState> {
  static const _counterKey = "azkar_counters";
  static const _lastResetKey =
      "last_reset_date"; // Key to store last reset date

  AzkarDetailsCubit(List<Map<String, String>>? dataList)
      : super(AzkarDetailsState(
          dataList: dataList,
          counters: List<int>.filled(dataList?.length ?? 0, 0),
        )) {
    _loadCounters();
  }

  // Method to increment the counter for a specific index
  void incrementCounter(int index) async {
    final maxCount = int.parse(state.dataList?[index]["count"] ?? "0");
    final currentCounters = List<int>.from(state.counters);
    if (currentCounters[index] < maxCount) {
      currentCounters[index]++;
      emit(state.copyWith(counters: currentCounters));
      await _saveCounters(currentCounters); // Save the updated counters
    }
  }

  // Method to check if counters need to be reset
  Future<void> _checkAndResetCountersIfNeeded() async {
    final now = DateTime.now();
    final lastResetString =
        await SharedPreferencesManager.getData(key: _lastResetKey);

    // If no reset date is found, or it's from a previous day, reset the counters
    if (lastResetString == null ||
        DateTime.parse(lastResetString).day != now.day) {
      await clearCounters(); // Clear counters if it's a new day
      await SharedPreferencesManager.setData(
          key: _lastResetKey,
          value: now.toIso8601String()); // Update last reset date
    }
  }

  // Method to clear the counters
  Future<void> clearCounters() async {
    final clearedCounters = List<int>.filled(state.dataList?.length ?? 0, 0);
    emit(state.copyWith(counters: clearedCounters));
    await _saveCounters(clearedCounters);
  }

  // Save counters to shared preferences
  Future<void> _saveCounters(List<int> counters) async {
    await SharedPreferencesManager.setData(
      key: _counterKey,
      value: counters.map((counter) => counter.toString()).toList(),
    );
  }

  // Load counters from shared preferences
  Future<void> _loadCounters() async {
    await _checkAndResetCountersIfNeeded(); // Check if counters need to be reset

    final counterStrings =
        await SharedPreferencesManager.getData(key: _counterKey);
    if (counterStrings != null &&
        counterStrings.length == state.dataList?.length) {
      final loadedCounters =
          counterStrings.map((str) => int.parse(str)).toList();
      emit(state.copyWith(counters: loadedCounters));
    }
  }
}
