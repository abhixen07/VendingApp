import 'package:flutter/material.dart';
import 'package:vending_app/ui/Pages/ProfilePage.dart';

import '../Drawer/drawer_side.dart';

class OrderhistoryPage extends StatefulWidget {
  const OrderhistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderhistoryPage> createState() => _OrderhistoryPageState();
}

class _OrderhistoryPageState extends State<OrderhistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        backgroundColor: Color(0xffffcc00),
      ),
      drawer: DrawerSide(), // Add Drawer to the left

    );
  }
}
