import 'package:flutter/material.dart';
import 'package:flutter_learn/widget/gesture_detector_back.dart';

abstract class BaseStateCustom<T extends StatefulWidget> extends State<T> {
  Widget createMaterialApp(
      Brightness brightness, String title, int crossAxisCount) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue, brightness: brightness),
      home: _createBody(title, crossAxisCount),
      routes: createRoutes(),
    );
  }

  // ignore: missing_return
  Map<String, WidgetBuilder> createRoutes() {}

  Widget _createBody(String title, int crossAxisCount) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: GestureDetectorBackWidget.getBackWidget(context),
      ),
      body: _createGridView(crossAxisCount),
    );
  }

  Widget _createGridView(int crossAxisCount) {
    return GridView.count(
      padding: const EdgeInsets.all(15),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      primary: false,
      children: createItems(),
    );
  }

  // ignore: missing_return
  List<Widget> createItems() {}

  Widget createItem(String title, page, String routeName) {
    return RaisedButton(
      elevation: 5,
      onPressed: () {
        setState(() {
          if (getIsName()) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        });
      },
      child: Text(title),
    );
  }

  // ignore: missing_return
  bool getIsName() {}
}
