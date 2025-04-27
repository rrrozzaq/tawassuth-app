import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/prayer_time_model.dart';

class PrayerTimeState {
  final PrayerTimeModel currentPrayer;
  final Duration countDown;
  final List<PrayerTimeModel> prayerTimes;

  PrayerTimeState({
    required this.currentPrayer,
    required this.countDown,
    required this.prayerTimes,
  });
}

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  Timer? _timer;

  final List<PrayerTimeModel> _prayerTimes;

  PrayerTimeCubit(this._prayerTimes)
    : super(
        PrayerTimeState(
          currentPrayer: _prayerTimes[0],
          countDown: _getTimeDifference(DateTime.now(), _prayerTimes[0].time),
          prayerTimes: _prayerTimes,
        ),
      ) {
    _startListening();
  }

  void _startListening() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updatePrayerTime();
    });
  }

  void _updatePrayerTime() {
    final now = DateTime.now();

    for (int i = 0; i < _prayerTimes.length; i++) {
      final prayer = _prayerTimes[i];

      if (now.isBefore(prayer.time)) {
        final remaining = _getTimeDifference(now, prayer.time);
        emit(
          PrayerTimeState(
            currentPrayer: prayer,
            countDown: remaining,
            prayerTimes: _prayerTimes,
          ),
        );
        return;
      }
    }

    // if all prayers are passed, show the first prayer of the next day
    // by adding 1 day to the first prayer
    final firstPrayerTomorrow = _prayerTimes[0].time.add(
      const Duration(days: 1),
    );
    final remaining = _getTimeDifference(now, firstPrayerTomorrow);
    emit(
      PrayerTimeState(
        currentPrayer: _prayerTimes[0],
        countDown: remaining,
        prayerTimes: _prayerTimes,
      ),
    );
  }

  static Duration _getTimeDifference(DateTime now, DateTime target) {
    return target.difference(now);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
