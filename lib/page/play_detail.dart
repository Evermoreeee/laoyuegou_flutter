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
          ],
        )
      ),
    );
  }
}