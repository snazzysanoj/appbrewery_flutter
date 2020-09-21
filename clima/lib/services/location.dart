import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;

  void getLocation() async {
    Position position;
    try {
      position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    } catch (e) {
      print('Error occured: $e');
    }
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
