import 'package:carousel_slider/carousel_slider.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/data/models/image_add.dart';
import 'package:flutter/material.dart';

class SliderAdds extends StatefulWidget {
  const SliderAdds({super.key});

  @override
  State<SliderAdds> createState() => _SliderAddsState();
}

class _SliderAddsState extends State<SliderAdds> {
  List<ImageAdd> imagesAdds = [];

  @override
  void initState() {
    super.initState();
    _getImagesAdds();
  }

  void _getImagesAdds() async {
    List<ImageAdd> adds =
        await ImageAdd.fromJsonList(context, 'assets/json/slider_adds.json');
    setState(() {
      imagesAdds = adds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDefaults.margin),
          child: Row(children: [
            Text("Anuncios",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ]),
        ),
        CarouselSlider(
          options: CarouselOptions(
            disableCenter: true,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imagesAdds
              .map((item) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Image(
                        image: AssetImage(item.image),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    // child: Center(
                    //   child: Image(
                    //     image: AssetImage(item.image),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
