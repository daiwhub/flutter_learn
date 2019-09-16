import 'package:flutter/material.dart';

///利用手势监听完整左上角返回键
class GestureDetectorBackWidget{
  static getBackWidget(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back),
    );
  }
}