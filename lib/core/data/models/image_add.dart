import 'dart:convert';

import 'package:flutter/material.dart';

class ImageAdd {
  ImageAdd({
    required this.image,
    required this.link,
  });

  String image;
  String link;

  factory ImageAdd.fromJson(Map<String, dynamic> json) => ImageAdd(
        image: json["image"],
        link: json["url"],
      );

  static Future<List<ImageAdd>> fromJsonList(
      BuildContext context, String jsonList) async {
    List<ImageAdd> imagesAdds = [];
    final String data =
        await DefaultAssetBundle.of(context).loadString(jsonList);

    final locations = json.decode(data);

    for (var item in locations) {
      imagesAdds.add(ImageAdd.fromJson(item));
    }
    return imagesAdds;
  }
}
