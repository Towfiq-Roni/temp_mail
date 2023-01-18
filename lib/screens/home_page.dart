// import 'package:flutter/material.dart';
// import 'package:temp_mail/screens/create_mail_page.dart';
//
// import 'inbox_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Home'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(onPressed: (){
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const CreateMailPage()));
//             }, child: const Text('Create Mail')),
//             ElevatedButton(onPressed: (){
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const InboxPage()));
//             }, child: const Text('Inbox'))
//           ],
//         ),
//       ),
//     );
//   }
// }
