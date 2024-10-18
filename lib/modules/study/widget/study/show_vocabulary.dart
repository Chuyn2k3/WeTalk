import 'package:flutter/material.dart';
import 'package:flutter_app/service/gen/assets.gen.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
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
  PageController scrollController = PageController(initialPage: 0);
  PageController scrollImageController = PageController(initialPage: 0);

  void _previousPage() {
  if (scrollController.hasClients) {
    int currentPage = scrollController.page!.toInt();
    if (currentPage > 0) {
      scrollController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

void _nextPage() {
  if (scrollController.hasClients) {
    int currentPage = scrollController.page!.toInt();
    if (currentPage < widget.vocabularyVideoResList.length - 1) {
      scrollController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

void _previousImagePage() {

  if (scrollImageController.hasClients) {
    int currentPage = scrollImageController.page!.toInt();
    if (currentPage > 0) {
      scrollImageController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

void _nextImagePage() {
  if (scrollImageController.hasClients) {
    int currentPage = scrollImageController.page!.toInt();
    if (currentPage < widget.vocabularyImageResList.length - 1) {
      scrollImageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

  Widget _showVideoItem(Size size, dynamic resList, PageController scrollController) {
    return SizedBox(
      height: size.height * 0.4,
      child: PageView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: resList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                resList[index].vocabularyContent ?? "",
                style: textTheme.t18M,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 12,
              ),
              if ((resList is List<VocabularyVideoResList>) &&
                  resList[index].videoLocation != null &&
                  resList[index].videoLocation!.isNotEmpty)
                PlayVideoVocabulary(
                    videoUrl: resList[index].videoLocation ?? ""),
              if ((resList is List<VocabularyImageResList>) &&
                  resList[index].imageLocation != null &&
                  resList[index].imageLocation!.isNotEmpty)
                Container(
                  height: size.height * 0.28,
                  width: size.width * 0.8,
                  padding: const EdgeInsets.all(8),
                  //margin: const EdgeInsets.symmetric(horizontal: 48),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(
                    resList[index].imageLocation ?? "",
                  ),
                ),
            ],
          );
        },
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
            if (widget.vocabularyVideoResList.isNotEmpty &&
                widget.vocabularyVideoResList[0].videoLocation != null)
              _showVideoItem(size, widget.vocabularyVideoResList,scrollController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(Assets.icon.arrowBackPng.path),
                  ),
                  onPressed: () => _previousPage(),
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
                  onPressed: () => _nextPage(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              "XEM ẢNH MINH HỌA",
              style: textTheme.t20B.copyWith(color: colorApp.labelPrimary),
            ),
            if (widget.vocabularyImageResList.isNotEmpty &&
                widget.vocabularyImageResList[0].imageLocation != null)
              _showVideoItem(size, widget.vocabularyImageResList,scrollImageController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(Assets.icon.arrowBackPng.path),
                  ),
                  onPressed: () => _previousImagePage(),
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
                  onPressed: () => _nextImagePage(),
                ),
              ],
            ),
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
