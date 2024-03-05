import 'dart:io';

import 'package:appdesign/screen7.dart';
import 'package:appdesign/screen9.dart';
import 'package:flutter/material.dart';

import 'screen9.dart';

class Screen8 extends StatefulWidget {
  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  static List<String> image = [
    "assets/images/6a1.png",
    "assets/images/6a2.png",
    "assets/images/6a3.png",
    "assets/images/6a4.png",
    "assets/images/6a5.png",
  ];

  final List<ShowImage> showImage =
      List.generate(image.length, (index) => ShowImage('${image[index]}'));
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Screen7()));
                    },
                  ),
                )),
              );
            },
          ),
          title: Text(
            "Mini Statement\n"
            "/storage/emulated/0/PDFtoJPG/Mini Statement",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (400 / 500),
                mainAxisSpacing: 10),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: image.length,
            itemBuilder: (context, index) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Screen9(
                              index: index,
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 0,
                            spreadRadius: 0,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          image[index],
                          fit: BoxFit.fill,
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Mini Stat_1.jpg",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class ShowImage {
  final String IMAGE;

  ShowImage(this.IMAGE);
}
