import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);


InputDecoration AppInputDecoration(labelText){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen,width: 1),
    ),
        fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite,width: 0),
    ),
    border: OutlineInputBorder(),
    labelText: labelText,
  );
}

SvgPicture ScreenBackground(context){
  return SvgPicture.asset("assets/images/screen-back.svg",
  alignment: Alignment.center,
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height,
  fit: BoxFit.cover,
  );
}

DecoratedBox AppDropdownStyle(child){
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorWhite,width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    primary: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),

  );
}

Ink SuccessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText,style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,

      ),),
    ),
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );

}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
  return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    mainAxisSpacing: 2,
    mainAxisExtent: 250,

  );

}