import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlantImage extends StatelessWidget {
  final String url;
  const PlantImage(
    this.url, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const SizedBox(
          height: 300,
          child: Center(
              child: CircularProgressIndicator(
            color: Color(0xff3E3E3E),
            strokeWidth: 2,
          ))),
    );
  }
}
