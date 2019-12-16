import 'package:flutter/material.dart';

/**
 *  登陆页面
 */
// TODO : shouye
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyLoginHome createState() => _MyLoginHome();
}

class _MyLoginHome extends State<LoginPage> {

   TextEditingController _userNameController = new TextEditingController();
   TextEditingController _userPwdController = new TextEditingController();
  void _handleClickSubmit() {
    print(_userNameController);
    if(_userNameController.text == 'tom' && _userPwdController.text == '123'){

      Navigator.of(context).pushNamed("home_page", arguments: "首页");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              //头像半径s
              radius: 60,
              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
              backgroundImage: NetworkImage(
                  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.fromLTRB(52.0, 0.0, 12.0, 0.0),
                  child: Icon(Icons.person,color: Colors.yellow),
                ),
                Expanded(
                    child: 
                    Padding(
                      padding: new EdgeInsets.fromLTRB(6.0, 0.0, 52.0, 0.0),
                      child:TextField(
                        controller: _userNameController,
                        maxLength: 8,
                        style: TextStyle(
                          color: Colors.green[400],
                        ),
                        decoration: new InputDecoration(
                          hintText: '请输入用户名',
                          helperText: '输入1-8个字母，汉字或数字',
                          suffixIcon:IconButton(
                            icon: new Icon(Icons.clear,
                                color: Colors.black45),
                            onPressed: () {
                              _userNameController.clear();
                            },
                          ),
                          helperStyle: TextStyle(
                            fontSize: 13,//字体变大
                          ),
                        ),
                      ) ,
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.fromLTRB(52.0, 0.0, 6.0, 0.0),
                  child: Icon(Icons.lock,color: Colors.yellow),
                ),
                Expanded(
                    child: 
                    Padding(
                      padding: new EdgeInsets.fromLTRB(6.0, 0.0, 52.0, 0.0),
                      child:TextField(
                        controller: _userPwdController,
                        style: TextStyle(
                          color: Colors.green[400],
                        ),
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: '请输入密码',
                          suffixIcon:IconButton(
                            icon: new Icon(Icons.clear,
                                color: Colors.black45),
                            onPressed: () {
                              _userPwdController.clear();
                            },
                          ),
                        ),
                      ) ,
                    )
                ),
              ],
            ),
            Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 52.0, 0.0, 0.0),
                  child:FlatButton(
                    child: Text("登陆"),
                    textColor: Colors.blue,
                    color: Colors.yellow,
                    splashColor:Colors.green,
                    highlightColor:Colors.pink,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed:  _handleClickSubmit,
                    // onPressed: () {
                    //   //导航到新路由
                    //   handleClickSubmit
                    //   Navigator.of(context).pushNamed("home_page", arguments: "首页");
                    // },
                  ), 
            ),
            
          ],
        ),
      ),
    ));
  }
 
  @override
  void reassemble() {
    super.reassemble();
    print("<=======reassemble=========>");
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text('你点击了$_counter xia')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
