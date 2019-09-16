import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_learn/widget/gesture_detector_back.dart';

///6-9 【装逼必备】动画Animation开发指南-Hero动画-1 (19:39)
class AnimationHero extends StatefulWidget {
  final Brightness brightness;

  AnimationHero({Key key, this.brightness = Brightness.light})
      : super(key: key);

  @override
  _AnimationHeroState createState() => _AnimationHeroState();
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final double width;
  final VoidCallback onTap;

  PhotoHero({Key key, this.photo, this.width, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          )),
    );
  }
}

class _AnimationHeroState extends State<AnimationHero> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    final String title = 'Basic Hero Animation';
    final String imageUrl = 'http://www.devio.org/img/avatar.png';
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetectorBackWidget.getBackWidget(context),
        ),
        body: Center(
          child: PhotoHero(
            photo: imageUrl,
            width: 300,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Flippers Page'),
                    leading: GestureDetectorBackWidget.getBackWidget(context),
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(16),
                    child: PhotoHero(
                      photo: imageUrl,
                      width: 100,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              }));
            },
          ),
        ),
      ),
    );
  }
}
