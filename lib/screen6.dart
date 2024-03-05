import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen6 extends StatefulWidget {
  Screen6(String folderName);

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  @override
  Widget build(BuildContext context) {
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
                    },
                  ),
                )),
              );
            },
          ),
          title: Text("Convert to Image",
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
                      icon: Image.asset('assets/images/cencal.png'),
                      onPressed: () => {},
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        body: Center(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(children: <Widget>[
                Text("20%",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    height: 107,
                    child: Image.asset("assets/images/cat.png"),
                  ),
                ),
                Container(
                    child: Text("0/2",
                        style: TextStyle(
                          fontSize: 16,
                        ))),
                Container(
                  child: Text(
                      "/storage/emulated/0/Paperwork/\n"
                      "Paper_Work_1690455687702.pdf",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                )
              ])),
        ));
  }
}
