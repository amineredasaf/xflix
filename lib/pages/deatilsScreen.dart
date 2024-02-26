import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchit/api/api.dart';
import 'package:watchit/constants.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/models/Series.dart';
import 'package:watchit/utils.dart';
import 'package:watchit/widgets/MoviesSliderWidget.dart';
import 'package:watchit/widgets/SeriesSliderWidget.dart';
import 'package:watchit/widgets/SliverAppBarWidget.dart';

class DeatilsScreen extends StatefulWidget {
  final Movie? movie;
  final Series? series;
  final String type; // movie or series
  const DeatilsScreen({
    super.key,
    this.movie,
    this.series,
    required this.type,
  });

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  late Future<List<Movie>> similarMovies;
  late Future<List<Series>> similarSeries;
  late dynamic similar;
  late String? date =
      widget.movie?.releaseDate ?? widget.series?.firstAirDate ?? 'No Date';

  @override
  void initState() {
    super.initState();
    // init only if the type is movie or series
    if (widget.type == 'movie') {
      similar = Api().getSimilarMovies(widget.movie?.id ?? 0);
    } else if (widget.type == 'tv') {
      similar = Api().getSimilarSeries(widget.series?.id ?? 0);
    }
    // similarMovies = Api().getSimilarMovies(this.widget.movie?.id ?? 0);
    // similarSeries = Api().getSimilarSeries(this.widget.series?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    print('details screen/build/ similar : $similar');
    print('details screen/build/ similar type : ${widget.type}');
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            movie: widget.movie,
            series: widget.series,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // OverViewMethod(), // overview section
                  const SizedBox(
                    height: 20,
                  ),
                  InfoMethod(), // release date and rating section
                  const SizedBox(
                    height: 20,
                  ),
                  OverViewMethod(), // overview section
                  const SizedBox(
                    height: 20,
                  ),
                  widget.type == 'movie'
                      ? SimilarMoviesMethod() // similar movies section
                      : SimilarSeriesMethod(), // similar series section
                  // SimilarMoviesMethod(), // similar movies section
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column OverViewMethod() {
    return Column(
      children: [
        Text(
          'overview',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.movie?.overview ?? widget.series?.overview ?? 'No overview',
          style: GoogleFonts.roboto(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Column SimilarMoviesMethod() {
    print('Movie method similar ');
    return Column(
      children: [
        Text(
          'Similar Movies',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: FutureBuilder(
            future: similar,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              } else if (snapshot.hasData) {
                return MoviesSlider(snapshot: snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Column SimilarSeriesMethod() {
    print('Series method similar ');
    return Column(
      children: [
        Text(
          'Similar Movies',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: FutureBuilder(
            future: similar,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Error: something went wrong');
                print(snapshot.error);
                return Center(
                  child: Text('Error: ${snapshot.error.toString()}'),
                );
              } else if (snapshot.hasData) {
                return SeriesSlider(snapshot: snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  SizedBox InfoMethod() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colours.ratingcolor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  'Release date: ',
                  style: GoogleFonts.sunflower(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  widget.movie?.releaseDate ??
                      widget.series?.firstAirDate ??
                      'No Date',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colours.ratingcolor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  'Rating : ',
                  style: GoogleFonts.sunflower(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  widget.movie?.voteAverage.toString() ??
                      widget.series?.voteAverage.toString() ??
                      'No rating',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
