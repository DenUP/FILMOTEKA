import 'package:flutter/material.dart';

class NewsCatalogWidget extends StatelessWidget {
  const NewsCatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // reverse: true,
        physics: const ScrollPhysics(parent: ClampingScrollPhysics()),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 18.0,
          crossAxisSpacing: 13.0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => print(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/post/shapkaTwo.jpg',
                  // height: 250,
                  // width: 100,
                  fit: BoxFit.cover,
                ),
              ));
        });
  }
}
