import 'dart:io';

import 'package:appdesign/termsnservice.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Subscription extends StatefulWidget {
  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final ScrollController _scrollController = ScrollController();
  bool _isButtonVisible = false;
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isButtonVisible = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "No Advertisements",
      "One-Time Payment",
      "Unlock All Features",
    ];
    List<String> image = [
      "assets/images/noadd.png",
      "assets/images/otimepay.png",
      "assets/images/unlockfea.png",
    ];
    List<String> backimg = [
      "assets/images/Ellipse 1.png",
      "assets/images/Ellipsered.png",
      "assets/images/Ellipsecream.png"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe5f9ee),
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: (Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/back3 1.png',
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              )),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset("assets/images/pro22.png"),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Text(
                "Get Premium\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 00, bottom: 30),
              child: Text(
                "Do you want to use this app without limits?\n"
                "Buy premium unlock all features",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              )),

          // The ListView.builder
          Expanded(
            child: ListView.builder(
              physics:
                  AlwaysScrollableScrollPhysics(), // Set AlwaysScrollableScrollPhysics
              itemCount: name.length + 1, // Add one for the additional content
              itemBuilder: (context, index) {
                if (index == name.length) {
                  // Display additional content at the bottom
                  return ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 50),
                      child: Text(
                        'One Time / \$499.00',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                } else {
                  // Display regular list items
                  return Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Card(
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(backimg[index]),
                                child: Image.asset(
                                  image[index],
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              title: Text(
                                name[index],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              tileColor: Colors.white,
                              trailing: Image.asset(
                                "assets/images/done.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.green),
            width: 350,
            height: 70,
            margin: EdgeInsets.only(bottom: 20),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Termsandservices()));
              },
              child: Text(
                'Buy Plan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
