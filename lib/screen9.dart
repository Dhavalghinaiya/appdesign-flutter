import 'dart:convert';
import 'dart:io';

import 'package:appdesign/screen8.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Screen9 extends StatefulWidget {
  int? index;
  Screen9({required this.index});
  State<Screen9> createState() => _Screen9State();
}

class ShowImage {
  final String imagePath;

  ShowImage(this.imagePath);
}

class _Screen9State extends State<Screen9> {
  Future<void> compressAndShareImage() async {
    final bytes = await rootBundle.load(image[widget.index!]);
    final list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();

    file.writeAsBytesSync(list);

    // Convert JPEG to PNG
    final compressedBytes = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      format: CompressFormat.png,
    );

    final pngFile = await File('${tempDir.path}/image.png').create();
    pngFile.writeAsBytesSync(compressedBytes);

    // Share the PNG file
    Share.shareFiles([pngFile.path], text: 'Great picture');
  }

  static List<String> image = [
    "assets/images/6a1.png",
    "assets/images/6a2.png",
    "assets/images/6a3.png",
    "assets/images/6a4.png",
    "assets/images/6a5.png",
  ];
  int index = 0;
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
                          MaterialPageRoute(builder: (context) => Screen8()));
                    },
                  ),
                )),
              );
            },
          ),
          title: Text(
            "Mini Statement\n1/5",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Image.asset(
              image[widget.index!],
              fit: BoxFit.fill,
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                          color: Colors.white),
                      child: Center(
                        child: IconButton(
                          icon: new Icon(Icons.delete, size: 40.0),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Delete"),
                                      content: Image.asset(
                                        "assets/images/delete_1.png",
                                        height: 100,
                                      ),
                                      actions: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0xffe84872)),
                                          width: 350,
                                          height: 70,
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Yes, Delete',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero, color: Colors.white),
                      child: Center(
                        child: IconButton(
                            icon: new Icon(Icons.share, size: 40.0),
                            onPressed: () async {
                              await compressAndShareImage();
                            }),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                          color: Colors.white),
                      child: Center(
                        child: IconButton(
                          icon: new Icon(Icons.info_outline, size: 40.0),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return Wrap(children: [
                                    ListTile(
                                      title: Text(
                                        "File Information",
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
                                        "View File",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "Mini Statement",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Path",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "/storage/emulated/0/Paperwork/ Paper_Work_1690455687702.pdf",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Last Modified",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "08/14/2023",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Size",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "259.38KB",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ]);
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
