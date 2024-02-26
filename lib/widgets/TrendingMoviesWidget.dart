import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watchit/constants.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/pages/deatilsScreen.dart';

class TrendingMovies extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TrendingMovies({
    super.key,
    // List<Movie>? snapshot,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 350,
          autoPlay: true,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DeatilsScreen(
                          movie: snapshot.data[itemIndex],
                          type: 'movie',
                        )),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                width: 209,
                child: Image.network(
                  '${Constants.imageUrl}' +
                      '${snapshot.data[itemIndex].posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
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
          );
        },
      ),
    );
  }
}
