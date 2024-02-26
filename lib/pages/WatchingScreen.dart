// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:watchit/widgets/backBtnWidget.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WatchingScreen extends StatefulWidget {
//   const WatchingScreen({super.key});

//   @override
//   State<WatchingScreen> createState() => _WatchingScreenState();
// }

// class _WatchingScreenState extends State<WatchingScreen> {
//   late VideoPlayerController? _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//           // Sample video URL
//           // ignore: prefer_single_quotes
//           'https://vidsrc.to/embed/tv/tt9561862/1/5'
//           // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//           ),
//     );
//     _initializeVideoPlayerFuture = _controller!.initialize();
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(builder: (context) {
//         return CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               leading: BackBtnWidget(),
//               pinned: true,
//               expandedHeight: 900,
//               backgroundColor: Colors.black,
//               flexibleSpace: Stack(
//                 children: [
//                   FutureBuilder(
//                       future: _initializeVideoPlayerFuture,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState == ConnectionState.done) {
//                           return AspectRatio(
//                             aspectRatio: _controller!.value.aspectRatio,
//                             child: VideoPlayer(_controller!),
//                           );
//                         } else {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                       }),
//                   Center(
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         setState(() {
//                           if (_controller!.value.isPlaying) {
//                             _controller!.pause();
//                           } else {
//                             _controller!.play();
//                           }
//                         });
//                       },
//                       child: Icon(_controller!.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchingScreen extends StatefulWidget {
  late int videoId;

  WatchingScreen({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  State<WatchingScreen> createState() => _WatchingScreenState();
}

class _WatchingScreenState extends State<WatchingScreen> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  late int _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = widget.videoId;
    controller
        .loadRequest(Uri.parse('https://vidsrc.to/embed/movie/$_videoId'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Watching Screen'),
        ),
        body: WebViewWidget(
          controller: controller,
          // click on button to play video
        ));
  }
}
