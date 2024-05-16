import 'package:flutter/material.dart';

abstract class mainStyle {
  static final decorationText = InputDecoration(
      suffixIcon: const Icon(Icons.password_outlined),
      isCollapsed: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      hintText: 'Password');
}
