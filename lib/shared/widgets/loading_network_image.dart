import 'package:flutter/material.dart';

class LoadingNetworkImage extends StatelessWidget {
  final url;
  LoadingNetworkImage({this.url});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (ctx, child, event) {
        if (event == null) return child;
        return Center(
          child: SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        );
      },
    );
  }
}
