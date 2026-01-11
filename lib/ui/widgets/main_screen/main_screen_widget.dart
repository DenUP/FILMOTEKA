import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/domain/factoryes/screen_factory.dart';
import 'package:filmoteka/ui/widgets/favorites/favorites_model.dart';
import 'package:filmoteka/ui/widgets/favorites/favorites_widget.dart';
import 'package:filmoteka/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final _screenFactory = ScreenFactory();
  final movieListModel = MovieListViewModel();
  int _selectedTab = 0;
  int _previousTab = 0; // Добавляем для отслеживания предыдущей вкладки

  void onSelectTab(int index) {
    // Если нажали на ту же вкладку - ничего не делаем
    if (_selectedTab == index) return;

    // Сохраняем предыдущую вкладку
    _previousTab = _selectedTab;

    // Если переходим НА вкладку "Избранное" (index == 2)
    if (index == 2) {
      // Используем read вместо watch, так как мы не в методе build
      NotifierProvider.read<FavoritesModel>(context)?.loadFavorites();
    }

    // Если уходим С вкладки "Избранное" (_selectedTab == 2)
    if (_selectedTab == 2) {
      // Можно что-то сделать при уходе с вкладки избранного
      // Например, остановить таймеры или очистить что-то
    }

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _screenFactory.makeNews(),
          _screenFactory.makeMovieList(),
          _screenFactory.makeFavorites(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: onSelectTab,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedTab == 0
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _selectedTab == 0 ? Icons.home : Icons.home_outlined,
                  size: 24,
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedTab == 1
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _selectedTab == 1 ? Icons.movie : Icons.movie_outlined,
                  size: 24,
                ),
              ),
              label: 'Фильмы',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedTab == 2
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _selectedTab == 2 ? Icons.favorite : Icons.favorite_border,
                  size: 24,
                ),
              ),
              label: 'Избранные',
            ),
          ],
        ),
      ),
    );
  }
}
