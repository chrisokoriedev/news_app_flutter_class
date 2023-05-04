// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
//
// class LocationController extends GetxController {
//   var _city = ''.obs;
//   var _state = ''.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _getCurrentLocation();
//   }
//
//   void _getCurrentLocation() async {
//     final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
//
//     final position = await geolocator.getCurrentPosition();
//
//     final placemarks = await geolocator.placemarkFromCoordinates(
//         position.latitude, position.longitude);
//
//     _city = placemarks[0].locality;
//     _state = placemarks[0].administrativeArea;
//   }
// }
