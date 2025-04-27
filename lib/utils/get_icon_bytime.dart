import '../generated/assets.gen.dart';

getImageByTime(String prayerTimes) {
  switch (prayerTimes) {
    case 'Subuh':
      return Assets.icons.prayertime.subuh;
    case 'Fajr':
      return Assets.icons.prayertime.fajr;
    case 'Dzuhr':
      return Assets.icons.prayertime.dzuhr;
    case 'Ashr':
      return Assets.icons.prayertime.ashr;
    case 'Magrib':
      return Assets.icons.prayertime.maghrib;
    default:
      return Assets.icons.prayertime.fajr;
  }
}
