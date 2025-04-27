import 'dart:developer';

import 'package:geocoding/geocoding.dart';

Future<String> getAddressFromLatLng(double latitude, double longitude) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;

      String address =
          '${place.locality}, ${place.administrativeArea}, ${place.country}';
      return address;
    } else {
      return 'Failed to get address';
    }
  } catch (e) {
    log('getAddressFromLatLng Error: $e');
    return 'Error: $e';
  }
}

DateTime todayAt(int hour, int minute, [int second = 0]) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, hour, minute, second);
}

String formatTwoDigits(int number) {
  return number.toString().padLeft(2, '0');
}
