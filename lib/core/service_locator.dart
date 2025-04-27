import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tawassuth/utils/color.dart';
import 'package:tawassuth/utils/function_helper.dart';
import '../screens/home/cubit/prayer_time_cubit.dart';
import '../screens/home/models/prayer_time_model.dart';
import 'user_state/user_data_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // userData Cubit
  getIt.registerLazySingleton<UserDataCubit>(() => UserDataCubit());

  // Register Cubit or Bloc Here
  getIt.registerLazySingleton<PrayerTimeCubit>(
    () => PrayerTimeCubit([
      PrayerTimeModel(
        name: 'Subuh',
        time: todayAt(4, 52),
        background: TColors.darkBlueBg,
      ),
      PrayerTimeModel(
        name: 'Fajr',
        time: todayAt(5, 34),
        background: TColors.mainColor,
      ),
      PrayerTimeModel(
        name: 'Dzuhr',
        time: todayAt(14, 52),
        background: TColors.greenBg,
      ),
      PrayerTimeModel(
        name: 'Ashr',
        time: todayAt(18, 11),
        background: TColors.darkBlueBg,
      ),
      PrayerTimeModel(
        name: 'Magrib',
        time: todayAt(19, 11),
        background: Colors.grey.shade800,
      ),
    ]),
  );
}
