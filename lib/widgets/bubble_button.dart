import 'package:flutter/material.dart';
import 'package:bee/constants/colors.dart';
import '../constants/colors.dart';


Widget bubbleButton(BuildContext context){
  final size = MediaQuery.of(context).size;
  return Container(
      height: size.height * 0.055,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: bubbleWhite.withOpacity(0.35),
          ),
          BoxShadow(
            color: darkOrange,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const[
          Text(
            "ADD",
            style: TextStyle(
              fontSize: 14,
              color: bubbleWhite,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      )
  );
}