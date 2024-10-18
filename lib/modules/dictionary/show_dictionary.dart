import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/service/gen/assets.gen.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class ShowVocabularyDictionary extends StatefulWidget {
  const ShowVocabularyDictionary({
    super.key,
    this.imageLocation,
    this.videoLocation,
    required this.name,
  });
  final String name;
  final String? imageLocation;
  final String? videoLocation;

  @override
  State<ShowVocabularyDictionary> createState() =>
      _ShowVocabularyDictionaryState();
}

class _ShowVocabularyDictionaryState extends State<ShowVocabularyDictionary> {
  Widget decodeBase64ToImage(String base64String) {
    if (base64String.contains(',')) {
      base64String =
          base64String.split(',')[1]; // Splitting to remove the prefix
    }
    Uint8List bytes = base64Decode(base64String);
    return Image.memory(bytes);
  }

  Widget _showVideoItem(
      Size size, String? imageLocation, String? videoLocation) {
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.name,
            style: textTheme.t18M,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 12,
          ),
          if (videoLocation != null)
            PlayVideoVocabulary(videoUrl: videoLocation),
          if (imageLocation != null)
            Container(
                height: size.height * 0.28,
                width: size.width * 0.8,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child:
                //decodeBase64ToImage(
                    //"data:image/jpeg;base64,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")

                Image.asset(
                  imageLocation,
                ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        onTap: () => Navigator.pop(context),
        title: "Minh họa từ vựng",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "XEM VIDEO BIỂU DIỄN",
              style: textTheme.t20B.copyWith(color: colorApp.labelPrimary),
            ),
            _showVideoItem(size, null, widget.videoLocation),
            const SizedBox(height: 24),
            Text(
              "XEM ẢNH MINH HỌA",
              style: textTheme.t20B.copyWith(color: colorApp.labelPrimary),
            ),
            _showVideoItem(size, widget.imageLocation, null),
          ],
        ),
      ),
    );
  }
}

class PlayVideoVocabulary extends StatefulWidget {
  const PlayVideoVocabulary({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<PlayVideoVocabulary> createState() => _PlayVideoVocabularyState();
}

class _PlayVideoVocabularyState extends State<PlayVideoVocabulary> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      //margin: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      height: size.height * 0.28,
      width: size.width * 0.8,
      child: _controller != null && _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!))
          : const Center(child: CircularIndicator()),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
