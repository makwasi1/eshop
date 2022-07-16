import 'package:eshop/src/widgets/other_app_bar.dart';
import 'package:eshop/src/widgets/vendor_feed.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({Key key}) : super(key: key);

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  VideoPlayerController videoPlayerController;
  Future<void> videoPlayerFuture;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
    videoPlayerFuture = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
          title: "PRODUCT PREVIEW",
        ),
        body: FutureBuilder(
          future: videoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: videoPlayerController.value.aspectRatio,
                child: VideoPlayer(videoPlayerController),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              videoPlayerController.value.isPlaying
                  ? videoPlayerController.pause()
                  : videoPlayerController.play();
            });
          },
          child: Icon(
            videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ));
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
