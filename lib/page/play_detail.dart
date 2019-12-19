import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/loading.dart';

import '../modelEntity/result.dart';


class PlayDetails extends StatefulWidget {
  PlayDetails({Key key}) : super(key: key);

  _PlayDetailsState createState() => _PlayDetailsState();
}

class _PlayDetailsState extends State<PlayDetails> {
  
  //页面返回参数
  void _handleCallBack(){
    Navigator.of(context).pop("ok~!");  
    // Provide.value<Counter>(context).increment(9);
  }



  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("这是一个对话框?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void showMySimpleDialog(BuildContext context){
     showDialog(
      context:context,
      builder: (context){
        return new AlertDialog(
            content: Container(
              width: 100,
              height: 200,
              color: Colors.cyan,
              child: RaisedButton(
                onPressed: () {
                  var currentCounter = Provide.value<Counter>(context).value;
                  currentCounter++;
                  print('a  ${currentCounter}');
                  Provide.value<Counter>(context).increment(currentCounter);
                },
                child: Text('增加'),
              ),
            ),
          );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title:  Text('${arguments.author}',style: TextStyle(color: Colors.cyan[400]),),
          backgroundColor: Colors.yellow,
          centerTitle:true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Text('路由返回'),
              onTap: ()=> _handleCallBack(),
            ),
            Provide<Counter>(
                builder: (context, child, counter) {
                  return Text(
                    '${counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  );
                },
            ),
            RaisedButton(
                onPressed: () {
                  var currentCounter = Provide.value<Counter>(context).value;
                  currentCounter++;
                  print('a  ${currentCounter}');
                  Provide.value<Counter>(context).increment(currentCounter);
                },
                child: Text('增加'),
              ),
            RaisedButton(
                onPressed: ()async {
                   bool delete = await  showDeleteConfirmDialog1();
                  if (delete == null) {
                      print("取消删除");
                    } else {
                      print("已确认删除");
                      //... 删除文件
                  }
                },
                child: Text('对话'),
            ),
            RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                    showMySimpleDialog(context);
                },
                child: Text('弹窗'),
            ),
          ],
        )
      ),
    );
  }
}