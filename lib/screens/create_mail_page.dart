import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:temp_mail/screens/inbox_page.dart';

import '../core/const.dart';
import 'home_page.dart';
import 'login_page.dart';

class CreateMailPage extends StatefulWidget {
  const CreateMailPage({Key? key}) : super(key: key);

  @override
  State<CreateMailPage> createState() => _CreateMailPageState();
}

class _CreateMailPageState extends State<CreateMailPage> {
  List<dynamic> domain = [];
  dynamic dropDownValue;
  // var create = Constants.createAccount;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // var staticList = [
  //   "/domains/63a26c236e3d7f644157801d",
  //   "Domain",
  //   "63a26c236e3d7f644157801d",
  //   "triots.com"
  // ];

  // = Constants.domain;
  // late String response;

  @override
  void initState() {
    // dropDownValue = domain[3];
    // dropDownValue = staticList[0];
    // var staticList;
    // var staticList = ["/domains/63a26c236e3d7f644157801d", "Domain",
    //   "63a26c236e3d7f644157801d", "triots.com"];

    _getDomains().then((value) {
      // domain = value;
      setState(() {
        domain = value;
        dropDownValue = domain[0];
        // var staticList = ["/domains/63a26c236e3d7f644157801d", "Domain",
        //   "63a26c236e3d7f644157801d", "triots.com"];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var create = Constants.createAccount;
    // var domain = Constants.domain;
    // var response;
    // String? dropDownValue = 'Click';
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    // TextEditingController confirmPasswordController = TextEditingController();
    // TextEditingController nameController = TextEditingController();l

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Mail'),
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
              // TextFormField(
              //   controller: nameController,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Your Name',
              //     labelStyle: TextStyle(color: Colors.black54),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.black54,
              //         )),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // Spacer(flex: 1,),
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
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: passwordController,
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
              // Spacer(flex: 1,),
              // TextFormField(
              //   controller: confirmPasswordController,
              //   decoration: const InputDecoration(
              //     labelText: 'Enter Confirm Password',
              //     labelStyle: TextStyle(color: Colors.black54),
              //     focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.black54,
              //         )),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              Spacer(
                flex: 1,
              ),

              // GestureDetector(
              //     onTap: () async{
              //       var value = await _getDomains();
              //       // if(value != null){
              //       //   response = await _getDomains();
              //       // }
              //       setState(() {
              //         domain = value;
              //
              //       });
              //     },
              //     child: Container(
              //       color: Colors.brown,
              //     padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              //     child: Text('Get Domain',
              //       style: TextStyle(color: Colors.white),
              //     )
              //     )
              // ),
              //
              // Spacer(
              //   flex: 1,
              // ),
              // domain != null
              //     ? Text(dropDownValue!)
              //     : Text('wrong but right'),

              ///working
              // Row(children: [
              //   domain != null
              //       ? Text(dropDownValue)
              //       : Text('wrong but right'),
              //   Spacer(flex: 1,),
              //   GestureDetector(onTap: () async{
              //     var value = await _getDomains();
              //     setState(() {
              //       domain = value;
              //     });
              //   },
              //     child: Icon(Icons.refresh),
              //   ),
              // ],),

              DropdownButton(
                  value: dropDownValue,
                  items: domain.map((var item) {
                    return DropdownMenuItem(value: item,
                        child: Text(item!["domain"].toString()));
                  }).toList(),
                  // items: domain?.map((var items) {
                  //   return DropdownMenuItem(value: items, child: Text(items));
                  // }).toList(),
                  // onTap: () async {
                  //   var domainData = await _getDomains();
                  //   if (domainData != null) {
                  //     setState(() {
                  //       dropDownValue = item;
                  //     });
                  //   }
                  // },
                  onChanged: (dynamic value) async {
                    print('working');
                    var domainData = await _getDomains();
                    if (domainData != null) {
                      setState(() {
                        dropDownValue = value!;
                      });
                    }
                  }),

              Spacer(flex: 1,),
              // ElevatedButton(
              //   // var login = Constants.baseUrl;
              //   onPressed: () {
              //     setState(() {
              //       create;
              //     });
              //     create != null ?
              //     Navigator.push(context, MaterialPageRoute(
              //         builder: (context) => const HomePage()),
              //     ): SnackBar(content: Text('Something went wrong'));
              //   },
              //   child: const Text('Register'),
              // ),
              GestureDetector(
                child: Container(
                  // color: Colors.cyan,
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Register', style: TextStyle(color: Colors.white),)),
                onTap: () async{
                  Response response = await _getInfo(emailController.text, passwordController.text);
                  print(response.body);
                  // setState(() {
                  //
                  // });
                  response.statusCode == 201
                      ? Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LogInPage()))
                      : SnackBar(content: Text('Something went wrong'));
                },
              ),
              Spacer(flex: 1,),
              GestureDetector(
                child: const Text('Have Account?'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LogInPage()));
                },
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const InboxPage()),
              //     );
              //   },
              //   child: const Text('Create Account'),
              // ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _getDomains() async {
    try {
      var url = Uri.parse(Constants.domain);
      Response response = await get(url);
      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        // print(parsed);
        var domainName = parsed['hydra:member'];
        print(domainName);
        // [0]['domain'];
        return domainName;
      }
    } catch (e) {
      print(e.toString());
    }
    // List<String> _domains;
    // _domains = (await Constants.domain) as List<String>;
    // return _domains;
  }

  Future<Response> _getInfo(String address, String password) async{
    return post(
      Uri.parse(Constants.createAccount),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'address': address,
        'password': password,
      }),
    );
  }

}
