import 'dart:io';

import 'package:appdesign/screen6.dart';
import 'package:appdesign/screen7.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with TickerProviderStateMixin {
  String folderName = "";
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
        bottom: TabBar(
          controller: TabController(
            // initialIndex: 0,
            length: 1,
            vsync: this,
          ),
          tabs: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 156,
                    height: 40,
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                        color: Color(0xff70c487)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "All Pdf",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: 156,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(30.0),
                        ),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "File Manager",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                    Navigator.pop(context);

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              )),
            );
          },
        ),
        title: Text("Select File",
            style: TextStyle(
              fontWeight: FontWeight.w600,
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
                    icon: Image.asset('assets/images/search (2) 1.png'),
                    onPressed: () => {},
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
                                "assets/images/8980021 1.png",
                                height: 40,
                                width: 40,
                              ),
                              title: Text(
                                name[index],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              subtitle: Text(
                                subname[index],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              tileColor: Colors.white,
                              trailing: IconButton(
                                icon: Image.asset(
                                  "assets/images/arrow-right 2.png",
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    builder: (context) {
                                      return Wrap(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              "Make your Selection",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
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
                                            title: Container(
                                              height: 45,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: TextButton(
                                                child: Container(
                                                  child: Text(
                                                    "View File",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Screen7()));
                                                },
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Container(
                                              height: 45,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: TextButton(
                                                  child: Container(
                                                    child: Text(
                                                      "Convert to Image",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    _showFolderNameDialog();
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFolderNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter Folder Name"),
        content: SizedBox(
          height: 45,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              setState(() {
                folderName = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Folder Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Screen6(folderName),
                ),
              );
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
