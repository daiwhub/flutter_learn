import 'package:flutter/material.dart';

///自定义字体
class ChangeFonts extends StatefulWidget {
  var brightness;

  ChangeFonts({Key key, this.brightness = Brightness.light}) : super(key: key);

  @override
  _ChangeFontsState createState() => _ChangeFontsState();
}

class _ChangeFontsState extends State<ChangeFonts> {
  TextStyle textStyle = TextStyle(fontFamily: 'Chilanka');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义字体',
      theme: ThemeData(brightness: widget.brightness ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('自定义字体',style: textStyle,),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: <Widget>[
            Text('My heart will go on',style: TextStyle(fontSize: 20,fontFamily: 'Chilanka'),),
            Text('My heart will go on',style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
