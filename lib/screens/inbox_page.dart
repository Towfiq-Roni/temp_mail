import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_mail/screens/message_page.dart';

import '../core/const.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<dynamic> domain = [];
  // Map<String, dynamic> mapped = {};

  @override
  void initState() {
    super.initState();
    _getMessages().then((value) {
      print(value.toString());
      setState(() {
        domain = value;
        // mapped = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var from = domain.map((var e) => Text(domain['from']['address'].toString()));
    // return FutureBuilder<dynamic>(
    //   future: _getMessages(),
    // builder: (context, AsyncSnapshot<dynamic> snapshot) {
    //     if(snapshot.hasData){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      endDrawer: Drawer(
        child: GestureDetector(
          // child: Container(
          // color: Colors.cyan,
          //   padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          //   decoration: BoxDecoration(
          //     color: Colors.brown,
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 50, 0, 0),
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.black),
            ),
          ),
          // ),
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove('token');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: Column(
          children: [
            StreamBuilder(
                stream: _getMessagesStream(),
                builder: (context, stream) {
                  // FutureBuilder<dynamic>(
                  //   future: _getMessages(),
                  //   builder: (context, AsyncSnapshot<dynamic> snapshot){
                  //     if(snapshot.hasData){
                  //   return
                  if (stream.hasData) {
                    // setState(() {
                    //   Future.delayed(Duration(seconds: 5));
                    //   // _getMessagesStream();
                    // });
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      domain[index]['subject'],
                                      // domain[0][3],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'From: ${domain[index]['from']['address']}',
                                      // 'From: ${domain[0][8]}',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                // );
                                // } else{
                                //   return const CircularProgressIndicator();
                                // }
                                // }
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MessagePage(
                                                value: (domain[index]['id']).toString())));
                              });
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              color: Colors.white,
                              height: 10,
                            ),
                        itemCount: domain.length);
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
    // }
    // else{
    //   return CircularProgressIndicator();
    // }
    // }
    // );
  }

  Future _getMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // print(token);
    try {
      var url = Uri.parse(Constants.message);
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
        var domain = parsed['hydra:member'];
        print(domain);
        return domain;
      }
    } catch (e) {
      print(e.toString());
    }
    // List<String> _domains;
    // _domains = (await Constants.domain) as List<String>;
    // return _domains;
  }

  Stream<dynamic> _getMessagesStream() async* {
    // while (true) {
    StreamController controller;
    controller = StreamController(
      onListen:() async* {
        await Future.delayed(Duration(seconds: 2));
        yield await _getMessages();
      }
    );
    // }
  }
}
