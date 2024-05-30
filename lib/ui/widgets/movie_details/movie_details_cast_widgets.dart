import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsCastWidgets extends StatelessWidget {
  const MovieDetailsCastWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 10),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
                itemExtent: 120,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/post/holland.jpeg',
                            width: 200,
                          ),
                        ),
                        Text('Tom Holland')
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
