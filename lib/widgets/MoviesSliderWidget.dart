import 'package:flutter/material.dart';
import 'package:watchit/constants.dart';
import 'package:watchit/pages/deatilsScreen.dart';

class MoviesSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const MoviesSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeatilsScreen(
                    movie: snapshot.data[index],
                    type: 'movie',
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  // margin: const EdgeInsets.only(right: 15),
                  height: 150,
                  width: 100,
                  child: Image.network(
                    '${Constants.imageUrl}' +
                        '${snapshot.data[index].posterPath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                      ));
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
