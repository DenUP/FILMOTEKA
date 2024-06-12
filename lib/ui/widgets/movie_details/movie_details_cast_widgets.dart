import 'package:filmoteka/Library/Widgets/inherited/provider.dart';
import 'package:filmoteka/ui/widgets/movie_details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsCastWidgets extends StatelessWidget {
  const MovieDetailsCastWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'В главных ролях',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemExtent: 130,
                scrollDirection: Axis.horizontal,
                itemCount: model?.movieDetails?.persons?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            model?.movieDetails?.persons
                                    ?.elementAt(index)
                                    .photo ??
                                '',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: Text(
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.start,
                              model?.movieDetails?.persons
                                      ?.elementAt(index)
                                      .name ??
                                  model?.movieDetails?.persons
                                      ?.elementAt(index)
                                      .enName ??
                                  ''),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
