import 'package:flutter/material.dart';

class InventoryManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc00),
        title: Text(
          'INVENTORY MANAGEMENT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: Text('Item 2'),
          ),
          ListTile(
            title: Text('Item 3'),
          ),
          ListTile(
            title: Text('Item 4'),
          ),
          ListTile(
            title: Text('Item 5'),
          ),
          ListTile(
            title: Text('Item 6'),
          ),

        ],
      ),
    );
  }
}
