import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 这是一个可以指定SafeArea区域背景色的AppBar
 * PreferredSizeWidget提供指定高度的方法
 * 如果没有约束其高度，则会使用PreferredSizeWidget指定的高度
 */
class XFileAppbar extends StatefulWidget implements PreferredSizeWidget {

  final double contentHeight; //从外部指定高度
  final Widget contentChild;  //从外部指定内容
  final Color statusBarColor; //设置statusbar的颜色

  XFileAppbar({this.contentChild, this.contentHeight, this.statusBarColor}): super();

  @override
  State<StatefulWidget> createState() {
    return new _XFileAppbarState();
  }

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);
  
}


/**
 * 这里没有直接用SafeArea，而是用Container包装了一层
 * 因为直接用SafeArea，会把顶部的statusBar区域留出空白
 * 外层Container会填充SafeArea，指定外层Container背景色也会覆盖原来SafeArea的颜色
 */
class _XFileAppbarState extends State<XFileAppbar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.cyan,
        child: new SafeArea(
        top: true,
        child: widget.contentChild,
      ),
    );
  }
}


class SliderView extends StatefulWidget {
  SliderView({Key key}) : super(key: key);

  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {

  static Color tabbarTextColor = Colors.black;

  final tabbarTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 18.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XFileAppbar(
        contentChild: Container(
          height:50.0 ,
          color: Colors.cyan,
          child: Center(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings_input_antenna,color: tabbarTextColor,),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text('我的',),
                          )
                        ),
                        Expanded(
                          child: Center(
                            child: Text('发现',style: TextStyle(
                              fontSize: 18.0,
                            ),),
                          )
                        ),
                        Expanded(
                          child: Center(
                            child: Text('云村'),
                          )
                        ),
                        Expanded(
                          child: Center(
                            child: Text('视频'),
                          )
                        ),
                      ],
                    ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search,color: tabbarTextColor,),
                  ),
                ],
              ),
          ),
        ), 
        contentHeight: 44.0,
        // statusBarColor: bkgColor,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Center(
          child: Hero(
            tag: 'ttt',
            child: Icon(Icons.track_changes,size: 150.0,color:Colors.cyan[100],),
          ),
        ),
      ),
    );
  }
}

// class HeroAnimationRouteB extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Hero(
//           tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
//           child: Image.asset("images/avatar.png"),
//       ),
//     );
//   }
// }