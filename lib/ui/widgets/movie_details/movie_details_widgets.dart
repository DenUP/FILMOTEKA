import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/Theme/color.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_cast_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_info_widgets.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidgets extends StatefulWidget {
  const MovieDetailsWidgets({
    super.key,
  });

  @override
  State<MovieDetailsWidgets> createState() => _MovieDetailsWidgetsState();
}

class _MovieDetailsWidgetsState extends State<MovieDetailsWidgets> {
  @override
  // void didChangeDependencies() {
  //   NotifierProvider.read<MovieDetailsModel>(context)?.loadDetails();
  //   super.didChangeDependencies();
  // }
  void initState() {
    NotifierProvider.read<MovieDetailsModel>(context)?.loadDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () {},
          ),
        ],
        title: const Text(
          'Detail',
          style: TextStyle(color: colors.mainTitle),
        ),
      ),
      body: ListView(
        children: const [
          MovieDetailsInfo(),
          SizedBox(
            height: 10,
          ),
          MovieDetailsCastWidgets(),
        ],
      ),
    );
  }
}
