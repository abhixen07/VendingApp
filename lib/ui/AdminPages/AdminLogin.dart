// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vending_app/ui/AdminPages/AdminMain.dart';
// import 'package:vending_app/ui/Drawer/FabTab.dart';
// import 'package:vending_app/ui/auth/login_screen.dart';
// import 'package:vending_app/ui/auth/login_with_phone_number.dart';
// import 'package:vending_app/ui/auth/signup_screen.dart';
// import 'package:vending_app/utils/utils.dart';
// import 'package:vending_app/widgets/round_button.dart';
//
// class AdminLogin extends StatefulWidget {
//   const AdminLogin({Key? key}) : super(key: key);
//
//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }
//
// class _AdminLoginState extends State<AdminLogin> {
//   bool loading = false;
//   final _formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
//
//   void login() {
//     setState(() {
//       loading = true;
//     });
//
//     final String adminEmail = 'adminme@gmail.com';
//     final String adminPassword = '000000';
//
//     if (emailController.text == adminEmail &&
//         passwordController.text == adminPassword) {
//       // Admin login successful
//       Utils().toastMessage('Admin login successful');
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => AdminMainPage()),
//       );
//     } else {
//       // Incorrect credentials
//       Utils().toastMessage('Incorrect email or password');
//     }
//
//     setState(() {
//       loading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Center(
//             child: const Text(
//               'ADMIN',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           backgroundColor: Color(0xffffcc00),
//         ),
//         body: Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/vending.png',
//                   height: 100,
//                   width: 100,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: emailController,
//                         decoration: const InputDecoration(
//                             hintText: 'Email',
//                             prefixIcon: Icon(Icons.alternate_email)),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter email';
//                           }
//                         },
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                             hintText: 'Password', prefixIcon: Icon(Icons.lock)),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter password';
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 RoundButton(
//                   title: 'Login',
//                   loading: loading,
//                   onTap: () {
//                     if (_formKey.currentState!.validate()) {
//                       login();
//                     }
//                   },
//                   buttonColor: Color(0xFFFFCC00),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Login as Customer?"),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => LoginScreen()));
//                         },
//                         child: Text('Login'))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
