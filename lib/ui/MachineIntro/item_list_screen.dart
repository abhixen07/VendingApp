// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class itemListScreen extends StatefulWidget {
//   final String machineId;
//   itemListScreen({required this.machineId});
//
//   @override
//   State<itemListScreen> createState() => _itemListScreenState();
// }
// class _itemListScreenState extends State<itemListScreen> {
//   final auth = FirebaseAuth.instance;
//   final nameController = TextEditingController();
//   final priceController = TextEditingController();
//   final quantityController = TextEditingController();
//
//   List<String> selectedIds = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffffcc00),
//         automaticallyImplyLeading: true,
//         title: Text('Items List'),
//         centerTitle: true,
//
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('Machines')
//             .doc(widget.machineId)
//             .collection('items')
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//            // return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data found'));
//           }
//           return ListView(
//               children: buildListTilesFromSubcollection(snapshot.data!),
//             );
//
//         },
//       ),
//
//
//     );
//   }
//
//   List<Widget> buildListTilesFromSubcollection(QuerySnapshot querySnapshot) {
//     return querySnapshot.docs.map((doc) {
//       var data = doc.data() as Map<String, dynamic>?;
//
//
//       if (data != null) {
//         String id = doc.id;
//         String itemName = data['itemName'] ?? ''; // Add null check and default value
//         String price = data['price'] ?? ''; // Add null check and default value
//         String quantity = data['quantity'] ?? ''; // Add null check and default value
//         String imageUrl = data['imageUrl']?? '';
//         bool isSelected = selectedIds.contains(id);
//         return ListTile(
//           leading: imageUrl != null ? Image.network(imageUrl) : SizedBox(), // Added leading widget for image
//           title: Text(itemName),
//           subtitle: Text('Price: $price, Quantity: $quantity'),
//         );
//       } else {
//         return SizedBox();
//       }
//     }).toList();
//   }
//
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class ItemListScreen extends StatefulWidget {
//   final String machineId;
//
//   ItemListScreen({required this.machineId});
//
//   @override
//   State<ItemListScreen> createState() => _ItemListScreenState();
// }
//
// class _ItemListScreenState extends State<ItemListScreen> {
//   final auth = FirebaseAuth.instance;
//   final nameController = TextEditingController();
//   final priceController = TextEditingController();
//   final quantityController = TextEditingController();
//
//   List<String> selectedIds = [];
//   int cartItemCount = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFFFCC00),
//         title: Text('Items List'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Show a toast or navigate to the cart page
//               // with the selected items when the cart icon is pressed.
//             },
//             icon: Icon(Icons.shopping_cart),
//           ),
//         ],
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('Machines')
//             .doc(widget.machineId)
//             .collection('items')
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data found'));
//           }
//           return ListView(
//             children: buildListTilesFromSubcollection(snapshot.data!),
//           );
//         },
//       ),
//     );
//   }
//
//   void addToCart() {
//     setState(() {
//       cartItemCount++; // Increment the cart count
//     });
//   }
//
//   List<Widget> buildListTilesFromSubcollection(QuerySnapshot querySnapshot) {
//     return querySnapshot.docs.map((doc) {
//       var data = doc.data() as Map<String, dynamic>?;
//
//       if (data != null) {
//         String id = doc.id;
//         String itemName = data['itemName'] ?? ''; // Add null check and default value
//         String price = data['price'] ?? ''; // Add null check and default value
//         String quantity = data['quantity'] ?? ''; // Add null check and default value
//         String imageUrl = data['imageUrl'] ?? '';
//         bool isSelected = selectedIds.contains(id);
//         return ListTile(
//           leading: imageUrl.isNotEmpty ? Image.network(imageUrl) : SizedBox(),
//           title: Text(itemName),
//           subtitle: Text('Price: $price, Quantity: $quantity'),
//           trailing: ElevatedButton(
//             onPressed: () {
//               addToCart(); // Call addToCart method when the button is pressed
//             },
//             child: Text('Add to Cart'),
//           ),
//         );
//       } else {
//         return SizedBox();
//       }
//     }).toList();
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemListScreen extends StatefulWidget {
  final String machineId;

  ItemListScreen({required this.machineId});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  List<String> selectedIds = [];
  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFCC00),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Items List'),
            SizedBox(width: 10),
            buildCartIcon(),
          ],
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Machines')
            .doc(widget.machineId)
            .collection('items')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data found'));
          }
          return ListView(
            children: buildListTilesFromSubcollection(snapshot.data!),
          );
        },
      ),
    );
  }

  Widget buildCartIcon() {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            // Show a toast or navigate to the cart page
            // with the selected items when the cart icon is pressed.
          },
          icon: Icon(Icons.shopping_cart),
        ),
        cartItemCount > 0
            ? Positioned(
          right: 8,
          top: 8,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10,
            child: Text(
              cartItemCount.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        )
            : SizedBox(),
      ],
    );
  }

  void addToCart() {
    setState(() {
      cartItemCount++; // Increment the cart count
    });
  }

  List<Widget> buildListTilesFromSubcollection(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>?;

      if (data != null) {
        String id = doc.id;
        String itemName = data['itemName'] ?? ''; // Add null check and default value
        String price = data['price'] ?? ''; // Add null check and default value
        String quantity = data['quantity'] ?? ''; // Add null check and default value
        String imageUrl = data['imageUrl'] ?? '';
        bool isSelected = selectedIds.contains(id);
        return ListTile(
          leading: imageUrl.isNotEmpty ? Image.network(imageUrl) : SizedBox(),
          title: Text(itemName),
          subtitle: Text('Price: $price, Quantity: $quantity'),
          trailing: ElevatedButton(
            onPressed: () {
              addToCart(); // Call addToCart method when the button is pressed
            },
            child: Text('Add to Cart'),
          ),
        );
      } else {
        return SizedBox();
      }
    }).toList();
  }
}