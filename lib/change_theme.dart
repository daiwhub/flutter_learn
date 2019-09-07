import 'package:flutter/material.dart';

///改版主题
class ChangeTheme extends StatefulWidget {
  var brightness;

  ChangeTheme({Key key,this.brightness = Brightness.light}) : super(key :key);

  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  String title = '改变Theme';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        brightness: widget.brightness
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetector(
            onTap: (){
              setState(() {
                bool _isLight = true;
                if(widget.brightness == Brightness.dark){
                  _isLight = false;
                }
                Navigator.pop(context,_isLight);
              });
            },
            child: Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            IconButton(
              icon: widget.brightness == Brightness.light
                  ? Image.asset('images/icon_light.png')
                  : Image.asset('images/icon_night.png'),
              onPressed: () {
                setState(() {
                  if (widget.brightness == Brightness.light) {
                    widget.brightness = Brightness.dark;
                  } else {
                    widget.brightness = Brightness.light;
                  }
                });
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
            ],
          ),
        ),
      ),
    );
  }
}
