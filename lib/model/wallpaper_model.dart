class wallpaper_model {
  String? photographer;
  String? photographer_url;
  int? photographer_id;
  SrcModel? src;

  wallpaper_model(
      {this.src,
      this.photographer_url,
      this.photographer,
      this.photographer_id});

  factory wallpaper_model.fromMap(Map<String, dynamic> jsonData) {
    return wallpaper_model(
        src: SrcModel.fromMap(jsonData["src"]),
        photographer_url: jsonData["photographer_url"],
        photographer: jsonData["photographer"],
        photographer_id: jsonData["photographer_id"]);
  }
}

class SrcModel {
  String? original;
  String? small;
  String? portrait;

  SrcModel({this.original, this.portrait, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(original: jsonData["original"],
    small: jsonData["small"],
    portrait: jsonData["portrait"]);
  }
}
