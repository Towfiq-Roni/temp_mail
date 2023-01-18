// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:temp_mail/screens/login_page.dart';
//
// import '../core/const.dart';
// import 'home_page.dart';
//
// class CreateAccountPage extends StatefulWidget {
//   const CreateAccountPage({Key? key}) : super(key: key);
//
//   @override
//   State<CreateAccountPage> createState() => _CreateAccountPageState();
// }
//
// class _CreateAccountPageState extends State<CreateAccountPage> {
//
//   var create = Constants.createAccount;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Create'),
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(flex: 10,),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'E-mail',
//                   hintText: 'Enter Your E-mail',
//                   labelStyle: TextStyle(color: Colors.black54),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black54,
//                       )
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//                 // onSaved: ,
//               ),
//               Spacer(flex: 1,),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Enter Password',
//                   labelStyle: TextStyle(color: Colors.black54),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.black54,
//                       )
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               Spacer(flex: 1,),
//               // ElevatedButton(
//               //   // var login = Constants.baseUrl;
//               //   onPressed: () {
//               //     setState(() {
//               //       create;
//               //     });
//               //     create != null ?
//               //     Navigator.push(context, MaterialPageRoute(
//               //         builder: (context) => const HomePage()),
//               //     ): SnackBar(content: Text('Something went wrong'));
//               //   },
//               //   child: const Text('Register'),
//               // ),
//               GestureDetector(
//                 child: Container(
//                   // color: Colors.cyan,
//                     padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
//                     decoration: BoxDecoration(
//                       color: Colors.brown,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text('Register', style: TextStyle(color: Colors.white),)),
//                 onTap: (){
//                   setState(() {
//
//                   });
//                   create != null
//                       ? Navigator.push(context, MaterialPageRoute(
//                       builder: (context) => const HomePage()))
//                       : SnackBar(content: Text('Something went wrong'));
//                 },
//               ),
//               Spacer(flex: 1,),
//               GestureDetector(
//                 child: const Text('Have Account?'),
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(
//                       builder: (context) => const LogInPage()));
//                 },
//               ),
//               Spacer(flex: 10,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future _getInfo(String? address, String? password) async{
//     try {
//       var url = Uri.parse(Constants.createAccount);
//       Response response = await post(url);
//       if (response.statusCode == 201) {
//         var parsed = json.encode(response.body);
//
//         // print(parsed);
//         // var domainName = parsed['hydra:member'];
//         // print(domainName);
//         // [0]['domain'];
//         // return domainName;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
