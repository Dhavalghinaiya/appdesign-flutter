import 'package:flutter/material.dart';
import 'package:appdesign/screen7.dart';
import 'package:appdesign/screen8.dart';
import 'package:appdesign/subscription.dart';
import 'package:appdesign/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffe5f9ee)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get selectedFormat => null;

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "Generated Images",
      "Settings",
      "User Guide",
      "Share with friends"
    ];
    List<String> image = [
      "assets/images/003-picture 1.png",
      "assets/images/005-settings 1.png",
      "assets/images/002-user-guide 1.png",
      "assets/images/007-sharing 1.png",
    ];
    List<String> backimg = [
      "assets/images/Ellipse 1.png",
      "assets/images/Ellipsered.png",
      "assets/images/Ellipse 1.png",
      "assets/images/Ellipsecream.png"
    ];
    return Scaffold(
      floatingActionButton: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          child: ListTile(
            title: Text(
              "Select File",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/images/pluse.png",
                  height: 20,
                  width: 20,
                )),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Screen2()));
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Color(0xFFC9F3DC),
          title: Text(
            "PDF to JPG\nConverter",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xffe5f9ee)),
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: IconButton(
                            icon: Image.asset(
                              "assets/images/pro22.png",
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Subscription(),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 20,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/three_dots_menu 1.png",
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 40),
        child: ListView.builder(
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
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        tileColor: Colors.white,
                        trailing: IconButton(
                          icon: Image.asset(
                            "assets/images/arrow-right 2.png",
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {
                            _navigateToScreen(index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Screen8()));
        break;
      case 1:
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          builder: (context) {
            String selectedFormat = ""; // Variable to store the selected format

            return Wrap(
              children: [
                ListTile(
                  title: Text(
                    "Settings (Output Format)",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                  leading: Icon(Icons.circle_outlined),
                  title: Text(
                    "JPG",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle_outlined),
                  title: Text(
                    "PNG",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
              ],
            );
          },
        );
        break;
      case 2:
        // Add navigation for the User Guide screen
        break;
      case 3:
        // Add navigation for the Share with friends screen
        break;
    }
  }
}
