
import 'package:flutter/material.dart';

///StatelessWidget与基础组件
class LessGroupPage extends StatelessWidget{
  LessGroupPage({Key key,this.brightness}) : super(key :key);

  var brightness;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String title = "StatelessWidget与基础组件";
    TextStyle textStyle = new TextStyle(color: Colors.green,fontSize: 20);
    return new MaterialApp(
      title: title,
      theme: new ThemeData(brightness: brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Text(title,style: textStyle,),
              Icon(Icons.android,color: Colors.amber,size: 50,),
              CloseButton(),
              BackButton(),
              Chip(avatar: Icon(Icons.people),
                label: Text("I am Chip"),
              ),
              Divider(
                color: Colors.black12,
                height: 10,//容器高度，不是线的高度
                indent: 10,//左侧间距
              ),
              Card(
                  color: Colors.orange,
                  elevation: 5,
                  child: new Container(
                    padding: EdgeInsets.all(10),
                    child: Text('I am Card',style: textStyle,),
                  )
              ),
              AlertDialog(
                title: Text("AlertDialog"),
                content: Text('I am AlertDialog',style: textStyle,),
              )
            ],
          ),
        ),
      )
    );
  }

}