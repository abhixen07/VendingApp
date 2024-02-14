// // providers.dart
//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vending_app/firebase_services/CartState.dart';
//
// final badgeValueProvider = Provider<int>((ref) {
//   // Logic to get the total quantity from the cart state
//   int totalQuantity = ref.watch(cartstateprovider).getTotalQuantity();
//   return totalQuantity;
// });
