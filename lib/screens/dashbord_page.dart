
import 'package:bee/constants/colors.dart';
import 'package:flutter/material.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _MyDashboard();

}

//te5edh objet profile mel base
class _MyDashboard extends State<Dashboard> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ beeUp,beeUp])),
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
                      SizedBox(height: 25),
                      Container(
                        width: 400,
                        //height: 900,
                        child: Image.asset(
                          "assets/cells.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(95,304, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "24",
                                  style: TextStyle(
                                    color: beeBrown,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            margin: EdgeInsets.fromLTRB(5,0, 73, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "120",
                                  style: TextStyle(
                                    color: beeBrown,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.fromLTRB(73,0, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "12k",
                                  style: TextStyle(
                                    color: beeBrown,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            margin: EdgeInsets.fromLTRB(5,0, 75, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "400",
                                  style: TextStyle(
                                    color: beeBrown,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                         Container(
                           width: 50,
                           margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                           child:  FloatingActionButton(onPressed: (){},
                             backgroundColor: darkOrange,
                             child: Text("Reset"),

                           ),
                         )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
