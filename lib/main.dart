import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/home.dart';

void main() {
  runApp(wallpaperHub());
}

class wallpaperHub extends StatelessWidget {
  const wallpaperHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wallpaper Hub",
      theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white
      ),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
