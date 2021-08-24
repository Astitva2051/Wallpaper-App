import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/category_search.dart';
import 'package:wallpaper_app/views/preview.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Wallpaper "),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}

class CategoriesTile extends StatelessWidget {
  final String? imgUrl;
  final String? title;

  CategoriesTile({required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    categorySearch(searchQuery: title.toString())));
      },
      child: Container(
        margin: EdgeInsets.all(3),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                imgUrl!,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    child: child,
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                },
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black26),
                child: Center(
                    child: Text(
                  title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}

Widget WallpapersList(List<wallpaper_model> wallpapers, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Preview(imgUrl: wallpaper.src!.portrait.toString())));
            },
            child: Hero(
              tag: wallpaper.src!.portrait.toString(),
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        wallpaper.src!.portrait.toString(),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ),
          );
      }).toList(),
    ),
  );
}
