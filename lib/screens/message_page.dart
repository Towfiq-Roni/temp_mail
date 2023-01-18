import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/const.dart';

class MessagePage extends StatefulWidget {
  final String value;
  const MessagePage({Key? key, required this.value}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // List<dynamic> domain = [];
  // Map<dynamic, dynamic> mapped = {};

  // @override
  // void initState() {
  //   super.initState();
  //   _getSingleMessage().then((value) {
  //     print(value.toString());
  //     setState(() {
  //       // mapped = value;
  //       // mapped = value;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(title: const Text('Message'),),
      body: Center(
        child: FutureBuilder(
          future: _getSingleMessage(),
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               return Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Spacer(flex: 1,),
                   Container(
                       width: MediaQuery.of(context).size.width,
                       color: Colors.grey.shade300,
                     padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                       margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                       child: Text(snapshot.data['subject'],
                         style: const TextStyle(fontSize: 16),)),
                   const Spacer(flex: 1,),
                   Container(
                       width: MediaQuery.of(context).size.width,
                       // height: MediaQuery.of(context).size.height / 2,
                       constraints: BoxConstraints(
                         minHeight: MediaQuery.of(context).size.height / 2,
                       ),
                     color: Colors.grey.shade300,
                       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                       margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                       child: Text(snapshot.data['text'],
                         style: const TextStyle(fontSize: 12),)),
                   const Spacer(flex: 10,),
                 ],
               );
             } else {
               return const CircularProgressIndicator();
             }
           }
        ),
      ),
    );
  }
  // Future _getSingleMessage() async {
  //   try {
  //     var url = Uri.parse(Constants.singleMessage);
  //     Response response = await get(url);
  //     if (response.statusCode == 200) {
  //       var parsed = json.decode(response.body);
  //       print(parsed);
  //       return parsed;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future _getSingleMessage() async {
    var singleMessage = '${Constants.singleMessage}/${widget.value}';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // print(token);
    try {
      var url = Uri.parse(singleMessage);
      Response response = await get(
        url,
        headers: <String, String>{
          // 'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        // Map<String, dynamic> map = Map.castFrom(jsonDecode(response.body));
        // var dataReq = map['hydra:member'];
        // Map<String, dynamic> finale = Map.from(dataReq);
        var parsed = json.decode(response.body);
        // Map<dynamic, dynamic> parsed = json.decode(response.body);
        // var domain = parsed[''];
        // print(domain);
        print(parsed);
        return parsed;
      }
    } catch (e) {
      print(e.toString());
    }
    // List<String> _domains;
    // _domains = (await Constants.domain) as List<String>;
    // return _domains;
  }
}
