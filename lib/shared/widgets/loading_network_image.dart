import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadingNetworkImage extends StatelessWidget {
  final url;
  LoadingNetworkImage({this.url});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (ctx, url) => Center(
        child: SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
