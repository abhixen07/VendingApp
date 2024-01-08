import 'package:flutter/material.dart';
import 'package:vending_app/ui/Drawer/FabTab.dart';
import 'package:vending_app/ui/Pages/AboutUs.dart';
import 'package:vending_app/ui/Pages/OrderHistoryPage.dart';
import 'package:vending_app/ui/auth/login_screen.dart';
import '../Drawer/drawer_side.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color primaryColor = Colors.white;
  Color textColor = Colors.black;
  Color scaffoldBackgroundColor = Color(0xffffcc00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: scaffoldBackgroundColor,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Your existing code
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(
                      icon: Icons.shop_outlined,
                      title: "My Orders",
                      backgroundColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FabTabs(selectedIndex: 2)),
                        );

                      },
                    ),
                    listTile(
                      icon: Icons.person_outline,
                      title: "Refer A Friends",
                      backgroundColor: Colors.white,
                    ),
                    listTile(
                      icon: Icons.add_chart,
                      title: "About Us",
                      backgroundColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUs()),
                        );

                      },
                    ),
                    listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Help",
                      backgroundColor: Colors.white,
                    ),
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                      backgroundColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/vending.png"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile({
    IconData? icon,
    String? title,
    VoidCallback? onTap,
    Color? backgroundColor,
  }) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon ?? Icons.error),
          title: Text(title ?? ""),
          tileColor: backgroundColor ?? Colors.blue,
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        )
      ],
    );
  }
}
