import 'package:flutter/material.dart';
import 'dart:developer';



class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  static String color1 = '#fff333';
  // final String params;
  @override
  Widget build(BuildContext context) {
    //获取路由参数  
    var args = ModalRoute.of(context).settings.arguments;
   
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body:Container(
        width: 200.0,
        height: 200.0,
        
        child:Center(
          child: Text(
            'ainizaixin kounankaiainizaixin kounankai',
            textAlign:TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              background: new Paint()..color = Colors.yellow,
            ),
          ),
        )
      )
      // body: Center(
      //   child: Text(
      //     "This is new route",
      //     textAlign: TextAlign.left,
      //     // style: TextStyle(
      //     //     color: Colors.blue,
      //     //     fontSize: 18.0,
      //     //     height: 1.2,
      //     //     fontFamily: "Courier",
      //     //     background: new Paint()..color = Colors.yellow,
      //     //     decoration: TextDecoration.underline,
      //     //     decorationStyle: TextDecorationStyle.dashed
      //     // ),
      //   ),
      // ),
    );
  }
  
  
}
