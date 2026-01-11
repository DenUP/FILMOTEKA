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
  final ScrollController _scrollController = ScrollController();
  late NewsModel _newsModel;

  @override
  void initState() {
    super.initState();
    _newsModel = NewsModel();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _newsModel.loadNextPage();
    }
  }

  Future<void> _loadInitialData() async {
    await _newsModel.resetMovie();
  }

  @override
  Widget build(BuildContext context) {
    return NotifierProvider(
      create: () => _newsModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Что вы хотите посмотреть?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await _newsModel.resetMovie();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Header TOP 5
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: NewsRatingWidgets(),
                ),

                // Заголовок "Популярные фильмы"
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Популярные фильмы',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                // Сетка с фильмами
                const NewsCatalogWidget(),

                // Индикатор загрузки
                NotifierProvider(
                  create: () => _newsModel,
                  child: Builder(
                    builder: (context) {
                      final model = NotifierProvider.watch<NewsModel>(context);
                      return model != null && model.isLoading
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : const SizedBox(height: 20);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
