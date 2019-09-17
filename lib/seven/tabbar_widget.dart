import 'package:flutter/material.dart';
import 'package:flutter_learn/widget/gesture_detector_back.dart';

///7-2 【搭了个框架】APP首页框架搭建-Scaffold之TabBar顶部导航
class TabBarWidget extends StatefulWidget {
  final Brightness brightness;

  TabBarWidget({Key key, this.brightness = Brightness.light}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    String title = 'TabBar顶部导航';
    return MaterialApp(
      title: title,
      theme:
          ThemeData(primaryColor: Colors.blue, brightness: widget.brightness),
      home: DefaultTabController(
          length: chiose.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
              leading: GestureDetectorBackWidget.getBackWidget(context),
              bottom: TabBar(
                tabs: chiose.map((Chiose chiose) {
                  return Tab(
                    text: chiose.title,
                    icon: Icon(chiose.icon),
                  );
                }).toList(),
                isScrollable: true,
              ),
            ),
            body: TabBarView(
                children: chiose.map((Chiose chiose) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChioseCar(
                  chiose: chiose,
                ),
              );
            }).toList()),
          )),
    );
  }
}

class Chiose {
  final String title;
  final IconData icon;

  const Chiose({this.title, this.icon});
}

const List<Chiose> chiose = const <Chiose>[
  const Chiose(title: 'CAR', icon: Icons.directions_car),
  const Chiose(title: 'BIKE', icon: Icons.directions_bike),
  const Chiose(title: 'BOAT', icon: Icons.directions_boat),
  const Chiose(title: 'BUS', icon: Icons.directions_bus),
  const Chiose(title: 'RAILWAY', icon: Icons.directions_railway),
  const Chiose(title: 'SUBWAY', icon: Icons.directions_subway),
  const Chiose(title: 'WALK', icon: Icons.directions_walk),
];

class ChioseCar extends StatelessWidget {
  final Chiose chiose;

  ChioseCar({Key key, this.chiose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Center(
        child: Text(
          chiose.title,
          style: textStyle,
        ),
      ),
    );
  }
}
