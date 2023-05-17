// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
//
// class LocationController extends GetxController {
//   var city = 'Loading...'.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getLocation();
//   }
//
//   void getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark placemark = placemarks[0];
//
//     String address = '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
//     print(address);
//
//     city.value =
//   }
// }
