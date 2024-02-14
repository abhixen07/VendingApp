import 'package:flutter/material.dart';
import 'package:vending_app/ui/AdminPages/inventorymanage.dart';
import 'package:vending_app/ui/AdminPages/machinemanage.dart';

class AdminMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc00),
        title: Text(
          'ADMIN MAIN PAGE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MachineManagement(),
                  ),
                );
              },
              child: Text('Machines'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventoryManagement(),
                  ),
                );
              },
              child: Text('Inventory'),
            ),
          ],
        ),
      ),
    );
  }
}
