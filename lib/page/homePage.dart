import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:io';

import '../modelEntity/result.dart';
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
  
  Future getListData ( {String name = '超人'} ) async {
    try{
      final url = "https://api.apiopen.top/searchMusic?name=${name}";
      final response = await Dio().get<String>(url);
      final body = jsonDecode(response.toString());
        // List resultList  = json.decode(response.body)['result'];
      var result = Result_body.fromJson(body).result;
      setState(() {
            playList = result;
      });
    }catch(e){
      print(e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      
       child: ListView.builder(
            itemCount: playList?.length,
            itemBuilder: (BuildContext context, int index) {
              var item = playList[index];
              return _buildItem(item);
            }
        ),
    );
  }
  
  Widget _buildItem(item){
    return Card(
      color: Colors.brown,
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
                          color: Colors.cyan,
                          fontSize: 14.5
                       ),
                    ),
                    Text(
                      '${item.lrc}',
                      maxLines:3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 12.0,
                      ),

                    )
                  ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right,color: Colors.cyan,)
          ],
          ),
      ),
    );
  }
}
