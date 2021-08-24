import 'package:wallpaper_app/model/categoriesmodel.dart';

String apikey = "563492ad6f917000010000015a14143ab81f4154b8cba71f9b8c80d6";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories =
      List<CategoriesModel>.empty(growable: true);
  CategoriesModel categorieModel1 = new CategoriesModel();

  categorieModel1.categoryName = "Nature";
  categorieModel1.imgUrl =
      "https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel1);
  CategoriesModel categorieModel2 = new CategoriesModel();

  categorieModel2.categoryName = "Bike";
  categorieModel2.imgUrl =
      "https://images.pexels.com/photos/2607554/pexels-photo-2607554.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel2);
  CategoriesModel categorieModel3 = new CategoriesModel();

  categorieModel3.categoryName = "Adventure";
  categorieModel3.imgUrl =
      "https://images.pexels.com/photos/373934/pexels-photo-373934.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel3);
  CategoriesModel categorieModel4 = new CategoriesModel();

  categorieModel4.categoryName = "Cars";
  categorieModel4.imgUrl =
      "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel4);
  CategoriesModel categorieModel5 = new CategoriesModel();

  categorieModel5.categoryName = "Street Art";
  categorieModel5.imgUrl =
      "https://images.pexels.com/photos/1805268/pexels-photo-1805268.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel5);
  CategoriesModel categorieModel6 = new CategoriesModel();

  categorieModel6.categoryName = "Wild Life";
  categorieModel6.imgUrl =
      "https://images.pexels.com/photos/625727/pexels-photo-625727.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorieModel6);

  return categories;
}
