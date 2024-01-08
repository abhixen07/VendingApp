import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vending_app/firebase_services/CartState.dart';

class CartItem {
  final String productName;
  final int quantity;
  final String image;
  final String price;

  CartItem({
    required this.productName,
    required this.quantity,
    required this.image,
    required this.price,
  });
}

class MyCartPage extends ConsumerStatefulWidget {

  const MyCartPage({super.key});

  @override
  ConsumerState<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends ConsumerState<MyCartPage> {


  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartstateprovider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc00),
        title: Text('My Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].productName),
            subtitle: Text('Quantity: ${cartItems[index].quantity}'),
            trailing: Text('Price: ${cartItems[index].price}'),
          );
        },
      ),
    );
  }
}