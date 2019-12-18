import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../modelEntity/result_body.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  static String color1 = '#fff333';

  // final String params;
  @override
  Widget build(BuildContext context) {
    //获取路由参数  
    var args = ModalRoute.of(context).settings.arguments;
   
    return Scaffold(
      appBar:  AppBar(
          leading:  Icon(Icons.toll,color:Colors.cyan,),
          title:  Text('你好 ${args} ',style: TextStyle(color: Colors.cyan[400]),),
          backgroundColor: Colors.yellow,
          centerTitle:true,
          actions: <Widget>[
              IconButton(
                icon: Icon(Icons.track_changes,color:Colors.cyan,),
              ),
          ],
      ),
      body:Container(
        child: ListContainer(),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon:  Icon(Icons.leak_add), 
              title:  Text('mo')
              ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.adjust), 
              title:  Text('adjust')
              ),
        ],
      ),
    );
  }
}

/**
 * 列表数据
 * doi请求
 */
class ListContainer extends StatefulWidget {
  ListContainer({Key key}) : super(key: key);

  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  List<Object> playList = [];
  ScrollController _scrollController = ScrollController();
  // 申明spinkit 
  final spinkit = SpinKitRotatingCircle(
    color: Colors.yellow,
    size: 70.0,
  );
  final pumpingHeart = Center(
    child: SpinKitPumpingHeart(color: Colors.red,size: 60.0,),
  );

  final spinkitdemo = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.red : Colors.green,
          ),
        );
      },
  );

  bool spinkitControll = true;

  List<String> singerlist = [
    '超人','承认','海口'
  ];
  /** 
   * search 根据姓名搜索
   * {String} name 姓名
   * TODO: https://api.apiopen.top/searchMusic
   */
  Future<Null> getListData ( String name ) async {
    try{
      final url = "https://api.apiopen.top/searchMusic?name=${name}";
      final response = await Dio().get<String>(url);
      final body = jsonDecode(response.toString());
        // List resultList  = json.decode(response.body)['result'];
      var result = Result_body.fromJson(body).result;
      new  Future.delayed(new  Duration(seconds:1),(){
        setState(() {
            playList = result;
            spinkitControll = false;
        });
      });

    }catch(e){
      print(e.toString());
    }
  }
  
  // 下拉刷新
  Future<Null> _handleRefresh(){
    getListData('海口');
    setState(() {
        spinkitControll = true;
    });
  }

  // 点击item 去详情
  void _handleOnTap(Object item) {
    print('_onLongPress');
      Navigator.of(context).pushNamed("detail_page",arguments:item);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.dispose();
    getListData('超人');
  }

  @override
  Widget build(BuildContext context) {
      return Container(
       // 添加spinkit 
        child: spinkitControll ? pumpingHeart : RefreshIndicator(
          child: ListView.builder(
              itemCount: playList?.length,
              itemBuilder: (BuildContext context, int index) {
                var item = playList[index];
                return  GestureDetector(
                  child: _buildItem(item),
                  onTap: () => _handleOnTap(item),
                );
              }
          ),
          onRefresh:_handleRefresh,
          displacement: 40.0,
          color: Colors.yellow,
        ) 
      );
  }

  Widget _buildItem(item){
    return Card(
      color: Colors.cyan,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Image.network(item.pic ,height: 80,width: 80,fit: BoxFit.cover,),
            SizedBox( width: 8,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${item.author}-${item.title}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5
                       ),
                    ),
                    Text(
                      '${item.lrc}',
                      maxLines:3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    )
                  ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right,color: Colors.cyan,),
            
          ],
          ),
      ),
    );
  }
}
