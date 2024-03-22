//import 'dart:io';

//import 'dart:js_interop';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/service/store.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  //VideoPlayerController? _controller;
  CachedVideoPlayerController? _controller;
  CustomVideoPlayerController? _customVideoPlayerController;
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
    //_controller = VideoPlayerController.networkUrl(Uri.parse(link));
    _controller = CachedVideoPlayerController.network(link);
    _controller!.initialize().then((_) {
      setState(() {});
      _controller!.setLooping(true);
      _controller!.play();
    });
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _controller!);
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_controller != null && _controller!.value.isInitialized) {
      return
          // AlertDialog(
          //   title: Text('Video Player'),
          //   content: Container(
          //     width: MediaQuery.of(context).size.width,
          //     child: _controller != null && _controller!.value.isInitialized
          //         ? AspectRatio(
          //             aspectRatio: _controller!.value.aspectRatio,
          //             child: CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController!,),
          //           )
          //         : CircularProgressIndicator(),
          //   ),
          //   actions: <Widget>[
          //     TextButton(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       child: Text('Close'),
          //     ),
          //   ],
          // );

          Container(
        height: size.height * 0.2,
        //width: size.width ,
        child: Center(
          child: _controller != null && _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: CustomVideoPlayer(
                    customVideoPlayerController:
                        _customVideoPlayerController!,
                  ),
                )
              : CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        height: size.height * 0.2,
        //width: size.width * 0.9,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
