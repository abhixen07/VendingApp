import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChocolateCategoryPage extends StatefulWidget {
  final String title;
  final String catImage;
  final String tag;

  const ChocolateCategoryPage ({
    Key? key,
    required this.title,
    required this.catImage,
    required this.tag,
  }) : super(key: key);

  @override
  State<ChocolateCategoryPage > createState() => _CategoriespageState();
}

Widget productsUI(
    String category,
    String pName,
    String price,
    String pid,
    String image,
    String type,
    String description,
    ) {
  return GestureDetector(
    onTap: () {
      // Handle the onTap event
    },
    child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                RatingBar(
                  initialRating: 4,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                    full: Icon(Icons.star, color: Colors.amber),
                    half: Icon(Icons.star_half, color: Colors.amber),
                    empty: Icon(Icons.star_border, color: Colors.amber),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (index) {
                    // Handle rating updates if needed
                  },
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 90,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.minus,
                        color: Colors.white,
                        size: 20,),

                      Text("1",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold

                        ),),

                      Icon(CupertinoIcons.plus,
                        color: Colors.white,
                        size: 20,)

                    ],
                  ),

                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(description ,
              style: TextStyle(
                fontSize: 16,),
              textAlign: TextAlign.justify,),
          ),
          SizedBox(height: 10,),

          Container(
            color: Color(0xD5D0D0FF),
            height: 70,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Text(
                    "  Total: ",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    price, // Combine "Total" and the price
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Adjust the space between the text and the container
                  Padding(
                    padding: EdgeInsets.only(left: 170,bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Buy Now logic
                      },
                      style: ElevatedButton.styleFrom(
                        //padding: EdgeInsets.all(10),
                        primary: Colors.red, // Change color as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ]
            ),
          ),

        ]
    ),);
}

class _CategoriespageState extends State<ChocolateCategoryPage> {
  final ref = FirebaseDatabase.instance
      .reference()
      .child('Products')
      .orderByChild('pid')
      .equalTo('p1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),

              title: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              backgroundColor: Colors.white,
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        widget.catImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.0),
                          Colors.black.withOpacity(.6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Expanded(
                child: FirebaseAnimatedList(
                  defaultChild: Text('loading'),
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index) {
                    return productsUI(
                      snapshot.child('category').value.toString(),
                      snapshot.child('pName').value.toString(),
                      snapshot.child('price').value.toString(),
                      snapshot.child('pid').value.toString(),
                      snapshot.child('image').value.toString(),
                      snapshot.child('type').value.toString(),
                      snapshot.child('description').value.toString(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}