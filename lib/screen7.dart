import 'dart:io';

import 'package:appdesign/screen2.dart';
import 'package:appdesign/screen6.dart';
import 'package:flutter/material.dart';
import 'package:appdesign/screen8.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen7 extends StatefulWidget {
  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "Mini Statement",
      "Personal Details",
      "Receipt",
      "Paperwork",
      "Personal Note",
      "Electricity bill",
      "Application form",
      "Document"
    ];
    List<String> subname = [
      "15/08/23 03:00 90.80kB",
      " 15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB",
      "15/08/23 03:00 90.80kB"
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC9F3DC),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: (Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: IconButton(
                    icon: Image.asset('assets/images/back3 1.png'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Screen2()));
                    },
                  ),
                )),
              );
            },
          ),
          title: Text("Generated Images",
              style: TextStyle(
                fontSize: 18,
              )),
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: IconButton(
                      icon: Image.asset('assets/images/sort4.png'),
                      onPressed: () => {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Sort By",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    trailing: IconButton(
                                      icon: Image.asset(
                                        "assets/images/close.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Name Ascending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Name Descending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Date Ascending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Date Descending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Size Ascending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Size Descending",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            })
                      },
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    reverse: false,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Card(
                                // margin: EdgeInsets.all(15),
                                elevation: 0,
                                child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/6a1.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                    title: Text(
                                      name[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    subtitle: Text(
                                      subname[index],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    tileColor: Colors.white,
                                    trailing: TextButton(
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Screen8()));
                                      },
                                    )),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
