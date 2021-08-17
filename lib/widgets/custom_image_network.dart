import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class CustomImageNetwork extends StatelessWidget {
  final String? imagePath;
  final String defaultImagePath;

  const CustomImageNetwork({
    Key? key,
    this.imagePath,
    this.defaultImagePath = UiConstant.defaultImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath ?? defaultImagePath,
    );
  }
}
