import 'package:filmoteka/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:filmoteka/ui/widgets/loader_widget/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }
}
