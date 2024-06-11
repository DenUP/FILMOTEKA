import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_model.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:filmoteka/ui/widgets/news/news_widgets.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final movieListModel = MovieListModel();
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  // @override
  // void initState() {
  //   movieListModel.loadNextPage();
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    // movieListModel.loadNextPage();
    movieListModel.resetMovie();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final model = NotifierProvider.read<MainScreenModel>(context);
    // final movieModel = NotifierProvider.watch<MovieListModel>(context);

    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const NewsWidgets(),
          NotifierProvider(
            model: movieListModel,
            child: const MovieListWidget(),
          ),
          const Text('Сериалы'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_sharp),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
