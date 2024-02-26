import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchit/constants.dart';
import 'package:watchit/models/Movie.dart';
import 'package:watchit/models/Series.dart';
import 'package:watchit/utils.dart';
import 'package:watchit/widgets/backBtnWidget.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    this.movie,
    this.series,
  });

  final Movie? movie;
  final Series? series;
  @override
  Widget build(BuildContext context) {
    int id = movie?.id ?? series?.id ?? 0;
    String title = movie?.title ?? series?.name ?? '';
    String backdropPath = movie?.BackdropPath ?? series?.backdropPath ?? '';
    String posterPath = movie?.posterPath ?? series?.posterPath ?? '';

    return SliverAppBar.large(
      title: Text(
        '${movie?.title ?? series?.name}',
        style: GoogleFonts.aBeeZee(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        PlayBtnWidget(id: id),
        // PlayBtnWidget(),
      ],
      leading: BackBtnWidget(),
      backgroundColor: Colours.ScaffoldBgcolor,
      expandedHeight: 300,
      pinned: true,
      floating: true,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(
              '${Constants.imageUrl}' + '${backdropPath}',
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
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colours.ScaffoldBgcolor,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Text(
                '${movie?.title ?? series?.name}',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // add button to watch
            // // watch now button
            // WatchNowButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class WatchNowButtonWidget extends StatelessWidget {
  const WatchNowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 195, 195, 195),
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(
            color: Colours.ScaffoldBgcolor,
            width: 2,
          ),
        ),
        onPressed: () {
          // Utils.launchURL('${movie.homepage}');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow,
              size: 30,
              color: Colours.ScaffoldBgcolor,
            ),
            Text(
              'Watch Now',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colours.ScaffoldBgcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
