import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final image;

  AppIcon({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    double imageSize;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      imageSize = (size.width * 2.0);
    } else {
      imageSize = (size.height * 2.0);
    }

    return Image.asset(image, height: imageSize,);
  }
}
