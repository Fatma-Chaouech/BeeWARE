import 'dart:async';
import 'dart:ffi';

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
  double? temperature;
  int? humidity;
  String? sound;
  double? weight;
  double? maxWeight;
  StreamSubscription? _tempStream;
  StreamSubscription? _humStream;
  StreamSubscription? _soundStream;
  StreamSubscription? _weightStream;
  StreamSubscription? _maxWeightStream;

  @override
  void initState() {
    _activateListeners();
    super.initState();
  }

  void _activateListeners() {
    var tempValue;
    var humValue;
    var soundValue;
    var weightValue;
    var maxWeightValue;
    DatabaseReference tempRef = FirebaseDatabase.instance.ref("temperature");
    DatabaseReference humRef = FirebaseDatabase.instance.ref("humidity");
    DatabaseReference soundRef = FirebaseDatabase.instance.ref("sound");
    DatabaseReference weightRef =
        FirebaseDatabase.instance.ref("weight/currentWeight");
    DatabaseReference maxWeightRef =
        FirebaseDatabase.instance.ref("weight/maxWeight");
    _tempStream = tempRef.onValue.listen((event) {
      tempValue = event.snapshot.value;
      if (tempValue != null && (tempValue! > 35.5 || tempValue! < 34.5)) {
        abTempSnackBar();
      }
      setState(() {
        temperature = tempValue;
      });
    });
    _humStream = humRef.onValue.listen((event) {
      humValue = event.snapshot.value;
      if (humValue != null && (humValue! > 60 || humValue! < 50)) {
        abHumiditySnackBar();
      }
      setState(() {
        humidity = humValue;
      });
    });
    _soundStream = soundRef.onValue.listen((event) {
      soundValue = event.snapshot.value;
      if (soundValue != null &&
          (int.parse(soundValue) > 500 || int.parse(soundValue) < 300)) {
        abTempSnackBar();
      }
      setState(() {
        sound = soundValue;
      });
    });
    _weightStream = weightRef.onValue.listen((event) {
      weightValue = event.snapshot.value;
      print(weightValue);
      var weightDiff = 100 - weightValue * 100 / maxWeight;
      if (weightDiff > 15) {
        abWeightSnackBar(weightDiff);
      }

      setState(() {
        weight = weightValue;
      });
    });
    _maxWeightStream = maxWeightRef.onValue.listen((event) {
      maxWeightValue = event.snapshot.value;
      var weightDiff = 100 - weight! * 100 / maxWeightValue!;
      if (weightDiff > 15) {
        abWeightSnackBar(weightDiff);
      }
      setState(() {
        maxWeight = maxWeightValue;
      });
    });
  }

  void abTempSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('we detected an abnormal temperature!'),
      backgroundColor: Colors.yellow[900],
      duration: const Duration(seconds: 10),
    ));
  }

  void abHumiditySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('we detected an abnormal humidity!'),
      backgroundColor: Colors.yellow[900],
      duration: const Duration(seconds: 10),
    ));
  }

  void abSoundSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('we detected an abnormal sound activity !'),
      backgroundColor: Colors.red[500],
      duration: const Duration(seconds: 10),
    ));
  }

  void abWeightSnackBar(var value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('we detected an abnormal weight loss : $weight% !'),
      backgroundColor: Colors.red[600],
      duration: const Duration(seconds: 10),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        key: _scaffoldKey,
        child: Scaffold(
          body: ListView(children: [
            Container(
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
                                margin: EdgeInsets.fromLTRB(100, 315, 5, 0),
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
                                  children: [
                                    Text(
                                      "$weight",
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
            )
          ]),
        ));
  }

  @override
  void deactivate() {
    _tempStream?.cancel();
    _humStream?.cancel();
    _soundStream?.cancel();
    super.deactivate();
  }
}
