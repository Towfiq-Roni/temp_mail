import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_mail/screens/create_account_page.dart';
import 'package:temp_mail/screens/create_mail_page.dart';
import 'package:temp_mail/screens/inbox_page.dart';
import 'package:temp_mail/screens/login_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print(token);
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: token == null
      ? MyApp()
      :InboxPage()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreateMailPage(),
    );
  }
}