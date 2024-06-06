import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/widgets/news/news_catalog_widget.dart';
import 'package:filmoteka/ui/widgets/news/news_rating_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsWidgets extends StatefulWidget {
  const NewsWidgets({super.key});

  @override
  State<NewsWidgets> createState() => _NewsWidgetsState();
}

class _NewsWidgetsState extends State<NewsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Что вы хотите посмотреть?',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: const [
          NewsRatingWidgets(),
          NewsCatalogWidget(),
        ],
      ),
    );
  }
}
