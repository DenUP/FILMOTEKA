import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/ui/widgets/news/news_catalog_widget.dart';
import 'package:filmoteka/ui/widgets/news/news_model.dart';
import 'package:filmoteka/ui/widgets/news/news_rating_widgets.dart';
import 'package:flutter/material.dart';

class NewsWidgets extends StatefulWidget {
  const NewsWidgets({super.key});

  @override
  State<NewsWidgets> createState() => _NewsWidgetsState();
}

class _NewsWidgetsState extends State<NewsWidgets> {
  final newsModel = NewsModel();


  @override
  void initState() {
    newsModel.resetMovie();
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header  TOP 5
            NotifierProvider(
              create: () => newsModel,
              isManagingModel: false,
              child: const NewsRatingWidgets(),
            ),
            // Container
            const Text(
              'Популярные фильмы',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            NotifierProvider(
              create: () => newsModel,
              isManagingModel: false,
              child: const NewsCatalogWidget(),
            ),

            // SizedBox(height: 500, child: NewsCatalogWidget())
          ],
        ),
      ),
    );
  }
}
