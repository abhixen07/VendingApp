import 'package:flutter/material.dart';

class MachineManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc00),
        title: Text(
          'MACHINE MANAGEMENT',
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
          ListTile(
            title: Text('Item 7'),
          ),
          ListTile(
            title: Text('Item 8'),
          ),
          ListTile(
            title: Text('Item 9'),
          ),
          ListTile(
            title: Text('Item 10'),
          ),
        ],
      ),
    );
  }
}
