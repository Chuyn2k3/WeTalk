import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class ShowVocabulary extends StatefulWidget {
  const ShowVocabulary({
    super.key,
    required this.vocabularyImageResList,
    required this.vocabularyVideoResList,
  });
  final List<VocabularyImageResList> vocabularyImageResList;
  final List<VocabularyVideoResList> vocabularyVideoResList;

  @override
  State<ShowVocabulary> createState() => _ShowVocabularyState();
}

class _ShowVocabularyState extends State<ShowVocabulary> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollImageController = ScrollController();

  void _previousPage(double widthItem) {
    scrollController.animateTo(
      scrollController.offset - widthItem,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage(double widthItem) {
    scrollController.animateTo(
      scrollController.offset + widthItem,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousImagePage(double widthItem) {
    scrollImageController.animateTo(
      scrollImageController.offset - widthItem,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextImagePage(double widthItem) {
    scrollImageController.animateTo(
      scrollImageController.offset + widthItem,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        onTap: () => Navigator.pop(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "XEM VIDEO BIỂU DIỄN",
            style: textTheme.t20B.copyWith(color: colorApp.labelPrimary),
          ),
          if (widget.vocabularyVideoResList.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: 210,
              width: double.infinity,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.vocabularyVideoResList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    width: 360,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.vocabularyVideoResList[index]
                                  .vocabularyContent ??
                              ""),
                          if (widget.vocabularyVideoResList[index]
                                      .videoLocation !=
                                  null &&
                              widget.vocabularyVideoResList[index]
                                  .videoLocation!
                                  .isNotEmpty)
                            PlayVideoVocabulary(
                                videoUrl: widget.vocabularyVideoResList[index]
                                        .videoLocation ??
                                    ""),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(Assets.icon.arrowBackPng.path),
                ),
                onPressed: () => _previousPage(size.width),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(Assets.icon.arrowForwardPng.path),
                ),
                onPressed: () => _nextPage(size.width),
              ),
            ],
          ),
          Text(
            "XEM ẢNH MINH HỌA",
            style: textTheme.t20B.copyWith(color: colorApp.labelPrimary),
          ),
          const SizedBox(height: 30),
          if (widget.vocabularyImageResList.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: 170,
              width: double.infinity,
              child: ListView.builder(
                controller: scrollImageController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.vocabularyImageResList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 270,
                    width: 360,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.vocabularyImageResList[index]
                                  .vocabularyContent ??
                              ""),
                          Image.network(
                            widget.vocabularyImageResList[index]
                                    .imageLocation ??
                                "",
                            width: size.width * 0.67,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(Assets.icon.arrowBackPng.path),
                ),
                onPressed: () => _previousImagePage(size.width),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Image(
                  width: 30,
                  height: 30,
                  image: AssetImage(Assets.icon.arrowForwardPng.path),
                ),
                onPressed: () => _nextImagePage(size.width),
              ),
            ],
          ),
        ],
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
    return SizedBox(
      height: size.height * 0.2,
      child: _controller != null && _controller!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
