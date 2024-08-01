import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loader_widget.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
      const Center(child: LoaderWidget()),
      errorWidget: (context, url, error) =>
          ErrorWidget.withDetails(message: error.toString()),
    );
  }
}
