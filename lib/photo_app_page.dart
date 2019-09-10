import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///拍照APP开发-图片获取与图片展示
class PhotoApp extends StatefulWidget {
  var brightness;

  PhotoApp({Key key, this.brightness = Brightness.light}) : super(key: key);

  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  String title = '拍照APP开发-图片获取与图片展示';

  List<File> _images = [];

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      if(image != null) {
        _images.add(image);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(brightness: widget.brightness),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>  _showSelect(),
            tooltip: 'Pick image',
            child: Icon(
              Icons.add_a_photo,
            )),
        body: Center(
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: _imagePicks(),
          ),
        ),
      ),
    );
  }

  _showSelect() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 120,
              child: Column(
                children: <Widget>[
                  item('拍照', true),
                  item('从相册获取', false),
                ],
              ),
            ));
  }

  item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _imagePicks() {
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(Icons.close),
                    ),
                  ),
                )),
          )
        ],
      );
    }).toList();
  }
}
