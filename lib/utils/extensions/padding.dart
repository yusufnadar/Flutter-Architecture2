import 'package:flutter/material.dart';
import 'package:real_mert_album/core/consts/app.dart';

extension PaddingExtension on Widget {
  Widget horizontal() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: App.horizontalPadding,
        vertical: App.verticalPadding,
      ),
      child: this,
    );
  }
}
