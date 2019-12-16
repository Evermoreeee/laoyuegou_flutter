import 'package:flutter/material.dart';

import 'page/login.dart';
import 'page/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '捞月狗',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        hintColor: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.yellow),//定义label字体样式
          hintStyle: TextStyle(color: Colors.yellow, fontSize: 14.0)//定义提示文本样式
        )
      ),
      /**
       * 注册路由表
       */
      routes:{
        "home_page":(context) => HomePage(),
      },
      home: LoginPage(title: '登陆'),
      /**
       * 权限管理
       */
      onGenerateRoute:(RouteSettings settings){
          return MaterialPageRoute(builder: (context){
              String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          }
        );
      }
    );
  }
}
