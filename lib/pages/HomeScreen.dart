import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchit/api/api.dart';
import 'package:watchit/constants.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/models/Series.dart';
import 'package:watchit/pages/searchResultScreen.dart';
import 'package:watchit/widgets/MoviesSliderWidget.dart';
import 'package:watchit/widgets/SeriesSliderWidget.dart';
import 'package:watchit/widgets/TrendingMoviesWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  // start of the code search

  void _performSearch(String query) async {
    final apiKey = Constants.accessToken; // Replace with your actual API key
    final url =
        'https://api.themoviedb.org/3/search/multi?query=$query&include_adult=false&language=en-US&page=1';

    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $apiKey'},
    );

    if (response.statusCode == 200) {
      // If the request is successful, parse the response data
      final jsonData = json.decode(response.body);

      // Extract the results from the response
      final List<dynamic> results = jsonData['results'];

      // filter result to only show movies and series
      final List<dynamic> filteredResults = results
          .where((result) =>
              result['media_type'] == 'movie' || result['media_type'] == 'tv')
          .toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(results: filteredResults),
        ),
      );
      // _showDropdownPage(results);
    } else {
      // If the request fails, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to search. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // end of the code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          // 'assets/Oraflix.png',
          'assets/m7labaflix.png',
          height: 40,
        ),
        actions: [
          AnimSearchBar(
            color: Colors.black,
            textFieldColor: Colors.grey[900],
            textFieldIconColor: Colors.red,
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontFamily: GoogleFonts.aBeeZee().fontFamily,
              fontWeight: FontWeight.bold,
            ),
            helpText: 'Search...',
            autoFocus: true,
            boxShadow: false,
            width: 250,
            textController: textSearchController,
            onSuffixTap: () {
              textSearchController.clear();
            },
            onSubmitted: (String) {
              _performSearch(String);
            },
            rtl: true,
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
