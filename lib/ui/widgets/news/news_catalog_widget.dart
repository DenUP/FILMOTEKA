import 'package:flutter/material.dart';

class NewsCatalogWidget extends StatelessWidget {
  const NewsCatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: fetchData(index),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Placeholder();
              } else {
                return GestureDetector(
                  child: Container(
                    color: Colors.amber,
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.green, fontSize: 130),
                    ),
                  ),
                );
              }
            },
          );
        });
  }

  fetchData(int index) {}
}
