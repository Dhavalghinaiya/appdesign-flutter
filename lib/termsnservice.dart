import 'dart:io';

import 'package:flutter/material.dart';

import 'main.dart';

class Termsandservices extends StatefulWidget {
  @override
  State<Termsandservices> createState() => _TermsandservicesState();
}

class _TermsandservicesState extends State<Termsandservices> {
  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "TERMS OF SERVICE",
      "PRIVACY POLICY",
      "USER AGREEMENT",
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        backgroundColor: Color(0xFFC9F3DC),
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Terms of Service",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              "assets/images/Terms of Service.png",
              height: 130,
              width: 130,
            ),
            SizedBox(height: 15),
            Text(
              "This app is governed by Rising App’s Terms of Service.\n"
              "By continuing to use this app you represent that you \n"
              "have read and accept the terms of Service. Privacy \n"
              "Policy and Permission disclosure.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(
                        name[index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.deepPurple),
                      ),
                      trailing: Image.asset(
                        "assets/images/arrow-right 2.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(15),
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Text(
            'Accept And Continue',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
