import 'dart:async';

import 'package:bee/constants/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _MyDashboard();
}

//te5edh objet profile mel base
class _MyDashboard extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int? temperature;
  int? humidity;
  String? sound;
  StreamSubscription? _tempStream;
  StreamSubscription? _humStream;
  StreamSubscription? _soundStream;

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    var value;
    DatabaseReference tempRef = FirebaseDatabase.instance.ref("temperature");
    DatabaseReference humRef = FirebaseDatabase.instance.ref("humidity");
    DatabaseReference soundRef = FirebaseDatabase.instance.ref("sound");

    _tempStream = tempRef.onValue.listen((event) {
      value = event.snapshot.value;
      print(event.snapshot.value);
      setState(() {
        temperature = value;
      });
    });
    _humStream = humRef.onValue.listen((event) {
      value = event.snapshot.value;
      setState(() {
        humidity = value;
      });
    });
    _soundStream = soundRef.onValue.listen((event) {
      value = event.snapshot.value;
      setState(() {
        sound = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      key: _scaffoldKey,
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [beeUp, beeUp])),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 400,
                  child: Image.asset(
                    "assets/beeware.png",
                    width: size.height * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 70),
                    Container(
                      width: 400,
                      height: 650,
                      child: Image.asset(
                        "assets/cells.png",
                        fit: BoxFit.cover,
                        height: size.height * 0.8,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(100, 320, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "$temperature",
                                style: TextStyle(
                                  color: beeBrown,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 65, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "$humidity %",
                                style: TextStyle(
                                  color: beeBrown,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.fromLTRB(100, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "$sound",
                                style: TextStyle(
                                  color: beeBrown,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 75, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "400",
                                style: TextStyle(
                                  color: beeBrown,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: 50,
                        //   margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                        //   child: FloatingActionButton(
                        //     onPressed: () {},
                        //     backgroundColor: darkOrange,
                        //     child: Text("Reset"),
                        //   ),
                        // )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }

  @override
  void deactivate() {
    _tempStream?.cancel();
    _humStream?.cancel();
    _soundStream?.cancel();
    super.deactivate();
  }
}
