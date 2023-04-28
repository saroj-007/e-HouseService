import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutomaticAddress {
  Position? position;

  late LocationPermission permission;

  Map<String, dynamic> location = {};

  // Function for automatic location of user
  Future<Map<String, dynamic>> getAddressFromLatLng() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      position = await Geolocator.getCurrentPosition();
      List<Placemark> placemark = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);

      String completeAddress =
          "${placemark[0].thoroughfare}, ${placemark[0].subLocality}, ${placemark[0].locality}, ${placemark[0].administrativeArea}, ${placemark[0].postalCode}, ${placemark[0].country}";

      location['fullAddress'] = completeAddress;
      sharedPrefs.setString("Location", completeAddress);

      return location;
    }
    return {};
  }
}
