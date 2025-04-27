import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> getUserLocation() async {
  // Checking is location service enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Checking permission status
  var permissionStatus = await Permission.location.status;
  if (permissionStatus.isDenied) {
    permissionStatus = await Permission.location.request();
  }

  if (permissionStatus.isPermanentlyDenied) {
    // if permission is permanently denied, open app settings
    await openAppSettings();
    return Future.error(
      'Location permission is permanently denied. Please enable it from settings.',
    );
  }

  if (permissionStatus.isGranted) {
    // If granted, get user location
    return await Geolocator.getCurrentPosition();
  } else {
    return Future.error('Location permission denied.');
  }
}
