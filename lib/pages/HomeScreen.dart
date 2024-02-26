import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchit/api/api.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/models/Series.dart';
import 'package:watchit/widgets/MoviesSliderWidget.dart';
import 'package:watchit/widgets/SeriesSliderWidget.dart';
import 'package:watchit/widgets/TrendingMoviesWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMoviesList;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Series>> topRatedSeries;
  TextEditingController textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    trendingMoviesList = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    topRatedSeries = Api().getTopRatedSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/Oraflix.png',
          // 'assets/m7labaflix.png',
          height: 40,
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.notifications,
          //     color: Colors.red,
          //   ),
          // ),
          AnimSearchBar(
            boxShadow: false,
            width: 250,
            textController: textSearchController,
            onSuffixTap: () {
              textSearchController.clear();
            },
            onSubmitted: (String) {},
            rtl: true,
            autoFocus: false,
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.red,
              size: 20,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.red,
              size: 20,
            ),
            // onSubmitted: onSubmitted,
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.red,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          // home
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            label: 'Home',
          ),
          // search
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.red,
          //   ),
          //   label: 'Search',
          // ),
          // downloads
          BottomNavigationBarItem(
            icon: Icon(
              Icons.save_alt,
              color: Colors.red,
            ),
            label: 'Saved',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Treanding Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // Trending Movies ...
              SizedBox(
                child: FutureBuilder(
                  future: trendingMoviesList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error.toString()}'),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingMovies(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Top Rated Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Top Rated Movies ...
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
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
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Top Rated Series',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Top Rated Series ...
              SizedBox(
                child: FutureBuilder(
                  future: topRatedSeries,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
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
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
