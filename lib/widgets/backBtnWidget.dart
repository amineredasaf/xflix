import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watchit/pages/WatchingScreen.dart';
import 'package:watchit/utils.dart';

class BackBtnWidget extends StatelessWidget {
  const BackBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        // bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Colours.ScaffoldBgcolor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          )),
    );
  }
}

class PlayBtnWidget extends StatelessWidget {
  final int id;
  const PlayBtnWidget({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(
        top: 10,
        right: 10,
        // bottom: 15,
      ),
      decoration: BoxDecoration(
        color: Colours.ScaffoldBgcolor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: IconButton(
          // onPressed: () => _launchURL(id),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WatchingScreen(
                  videoId: id,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.play_circle_fill,
            size: 20,
            color: Colors.red,
          )),
    );
  }
}

_launchURL(int id) async {
  final url = 'https://vidsrc.to/embed/movie/$id';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
