import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provide/provide.dart';

//路由
import 'page/login.dart';
import 'page/homePage.dart';
import 'page/play_detail.dart';
import 'provide/loading.dart';
import 'page/wangyi_center.dart';
void main() {
  //状态
  var counter = Counter();
  var providers = Providers();
  
  providers
    ..provide(Provider<Counter>.value(counter));
  
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '捞月狗',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        hintColor: Colors.yellow,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.deepOrange),//定义label字体样式
          hintStyle: TextStyle(color: Colors.deepOrange, fontSize: 14.0)//定义提示文本样式
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
      /**
       * 注册路由表
       */
      routes:{
        "home_page":(context) => HomePage(),
        'detail_page':(context) => PlayDetails(),
        'wangyi_center':(context) => SliderView(),
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
    )
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<Null> _handleRefresh(){
    print('object');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  RefreshIndicator(
        child: Card(
          color: Colors.yellow,
        ),
        onRefresh:_handleRefresh
      )
    );
  }
}


class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "./images/avatar.png", fit: BoxFit.cover,),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}