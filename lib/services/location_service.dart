import 'package:geocoding/geocoding.dart' as locator;
import 'package:geolocator/geolocator.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

class LocationService {
  static Future<Position> _getCurrentPosition() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Please enable location service');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission not granted');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  static getCurrentLocation() async {
    final position = await _getCurrentPosition();

    print('Latitude: ${position.latitude}');
    print('Longitude: ${position.longitude}');

    final list = await locator.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    AppConstants.addressStreet =
        '${list[0].street}, ${list[0].locality}, ${list[0].country}';

    print(AppConstants.addressStreet);
  }
}
