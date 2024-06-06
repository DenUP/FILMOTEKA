import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsCatalogWidget extends StatelessWidget {
  const NewsCatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCard = (constraints.biggest.height - spacerHeight / 2.0);
    });
  }
}
