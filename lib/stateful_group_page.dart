import 'package:flutter/material.dart';
import 'package:flutter_learn/change_theme.dart';

///StatefulWidget基础组件

class StatefulGroupPage extends StatefulWidget {
  var brightness;

  StatefulGroupPage({Key key, this.brightness = Brightness.dark})
      : super(key: key);

  @override
  _StatefulGroupState createState() => _StatefulGroupState();
}

class _StatefulGroupState extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String title = 'StatefulWidget基础组件';
    TextStyle textStyle = TextStyle(color: Colors.black, fontSize: 10);
    return MaterialApp(
      title: title,
      theme: new ThemeData(brightness: widget.brightness),
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.perm_identity,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.blue,
                  ),
                  title: Text('我的')),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                        context,
                        (MaterialPageRoute(
                            builder: (context) => ChangeTheme(
                                  brightness: widget.brightness,
                                ))))
                    .then((value) {
                  if (value) {
                    widget.brightness = Brightness.light;
                  } else {
                    widget.brightness = Brightness.dark;
                  }
                });
              },
              elevation: 10,
              child: Text('点我')),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                        'http://www.devio.org/img/avatar.png',
                        width: 100,
                        height: 100,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            hintText: '请输入',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration:
                            BoxDecoration(color: Colors.lightBlueAccent),
                        child: PageView(
                          children: <Widget>[
                            _item('Page1', Colors.green),
                            _item('Page2', Colors.orange),
                            _item('Page3', Colors.deepPurple),
                          ],
                        ),
                      )
                    ],
                  ),
                  onRefresh: _handleRefresh)
              : Container(
                  child: Text(
                    'I am List',
                    style: textStyle,
                  ),
                )),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
