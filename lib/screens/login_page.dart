import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_mail/screens/create_account_page.dart';
import 'package:temp_mail/screens/create_mail_page.dart';
import 'package:temp_mail/screens/home_page.dart';
import 'package:temp_mail/screens/inbox_page.dart';

import '../core/const.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var tokens = Constants.login;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Temp Mail'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Enter Your E-mail',
                  labelStyle: TextStyle(color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black54,
                  )),
                  border: OutlineInputBorder(),
                ),
                // onSaved: ,
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  labelStyle: TextStyle(color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black54,
                  )),
                  border: OutlineInputBorder(),
                ),
              ),
              Spacer(
                flex: 1,
              ),

              // ElevatedButton(
              //   // var login = Constants.baseUrl;
              //   onPressed: () {
              //     setState(() {
              //       // tokens;
              //     });
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => const HomePage()),
              //     );
              //   },
              //   child: const Text('Log In'),
              // ),

              GestureDetector(
                child: Container(
                    // color: Colors.cyan,
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    )),
                onTap: () async {
                  Response response = await _getToken(
                      emailController.text, passwordController.text);
                  print(response.body);
                  var whatevs = jsonDecode(response.body);
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('token', whatevs['token']);
                  pref.setString('email', emailController.text);
                  // setState(() {
                  //
                  // });
                  response.statusCode == 200
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxPage()))
                      : SnackBar(content: Text('Something went wrong'));
                },
              ),

              Spacer(
                flex: 1,
              ),
              GestureDetector(
                child: const Text('Create Account?'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateMailPage()));
                },
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Response> _getToken(String address, String password) async {
    return post(
      Uri.parse(Constants.token),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'address': address,
        'password': password,
      }),
    );
  }

// void _getUser(){
//
// }

}
