import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  VideoPlayerController? _controller;
  String link = '';

  Future<String> getLink() async {
    String videoUrlLink = await FirebaseStorage.instance
        .refFromURL('gs://app-signal-e7d7e.appspot.com/${widget.videoUrl}')
        .getDownloadURL();

    return videoUrlLink;
  }

  Future<void> get() async {
    String a = await getLink();
    setState(() {
      link = a;
    });
    _controller = VideoPlayerController.network(link);
    _controller!.initialize().then((_) {
      setState(() {});
      _controller!.setLooping(true);
      _controller!.play();
    });
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
