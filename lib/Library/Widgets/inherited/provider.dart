import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;
  const NotifierProvider({
    required this.model,
    required super.child,
    super.key,
  }) : super(
          notifier: model,
        );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()
        ?.widget;
    return widget is NotifierProvider<Model> ? widget.model : null;
  }
}

// Обычный Provider

class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider({
    required this.model,
    required super.child,
    super.key,
  });

  static Model? watch<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<Provider<Model>>()
        ?.widget;
    return widget is Provider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    // TODO: implement updateShouldNotify
    return model != oldWidget.model;
  }
}
