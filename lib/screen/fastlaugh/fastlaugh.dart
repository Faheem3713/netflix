import 'package:flutter/material.dart';
import 'package:netflix/services/apiservices.dart';
import 'package:video_player/video_player.dart';
import '../common/widgets/icon_text.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          4,
          (index) => Stack(
                children: [
                  VideoPlaying(
                      videoUrl: ApiEndPoints.videoUrls[index],
                      height: MediaQuery.of(context).size.height),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    left: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.volume_off_rounded)),
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/avengers.jpg'),
                                ),
                                IconText(
                                  icon: Icons.emoji_emotions,
                                  text: 'LOL',
                                  onPressed: () {},
                                ),
                                IconText(
                                    icon: Icons.add,
                                    text: 'My List',
                                    onPressed: () {}),
                                IconText(
                                    icon: Icons.share,
                                    text: 'Share',
                                    onPressed: () {}),
                                IconText(
                                    icon: Icons.play_arrow,
                                    text: 'Play',
                                    onPressed: () {})
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}

class VideoPlaying extends StatefulWidget {
  const VideoPlaying({super.key, required this.videoUrl, required this.height});
  final String videoUrl;
  final double height;
  @override
  State<VideoPlaying> createState() => _VideoPlayingState();
}

class _VideoPlayingState extends State<VideoPlaying> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        setState(() {
          _videoController.play();
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Center(
        child: _videoController.value.isInitialized
            ? Transform.scale(
                scale: _videoController.value.aspectRatio / deviceRatio,
                child: AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                ),
              )
            : const CircularProgressIndicator());
  }
}
