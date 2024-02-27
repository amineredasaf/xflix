import 'package:flutter/material.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/models/Series.dart';
import 'package:watchit/pages/deatilsScreen.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<dynamic> results;

  const SearchResultsScreen({Key? key, required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results (${results.length})'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          return GestureDetector(
            onTap: () => _navigateToDetailsScreen(context, result),
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: result['media_type'] == 'movie'
                  ? Colors.grey[900]
                  : Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      image: result['poster_path'] != null &&
                              result['poster_path'].isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w300${result['poster_path']}'),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: result['poster_path'] == null ||
                            result['poster_path'].isEmpty
                        ? Center(
                            child: Text(
                              'N/A',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          )
                        : null,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result['title'] ?? result['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          result['media_type'] == 'movie' ? 'Movie' : 'Series',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          result['media_type'] == 'movie'
                              ? result['release_date'] ?? 'N/A'
                              : result['first_air_date'] ?? 'N/A',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetailsScreen(BuildContext context, dynamic result) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeatilsScreen(
          type: result['media_type'],
          movie:
              result['media_type'] == 'movie' ? Movie.fromJson(result) : null,
          series: result['media_type'] == 'tv' ? Series.fromJson(result) : null,
        ),
      ),
    );
  }
}
