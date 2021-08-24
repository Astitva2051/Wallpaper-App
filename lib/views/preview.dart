
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Preview extends StatefulWidget {
  final String imgUrl;

  Preview({Key? key, required this.imgUrl}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  String _wallpaperFile = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Hero(
        tag: widget.imgUrl,
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.imgUrl, fit: BoxFit.cover)),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                setWallpaper();
              },
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xFF1C1BB).withOpacity(0.8), width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Set Wallpaper",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "Image will be saved in gallery",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ]));
  }

  Future<void> setWallpaper() async {
    _askPermission();
    setState(() {
      _wallpaperFile = "Loading";
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(widget.imgUrl);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _wallpaperFile = result;
    });
  }

  _askPermission() async {
    var status = await Permission.storage.request();
    if (status.isDenied) {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text('Storage Permission'),
                content: Text('This app requires storage access'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Deny'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    child: Text('Settings'),
                    onPressed: () => openAppSettings(),
                  ),
                ],
              ));
    }
  }
}
