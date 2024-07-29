import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/widget/study/vocabulary_widget.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key, required this.listVocabulary});
  final VocabularyModel listVocabulary;
  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.listVocabulary.data;
    if (data != null) {
      return GridView.count(
        crossAxisCount: 2,
        children: data
            .map((e) => vocabularyWidget(
                  e.content ?? "",
                  e.vocabularyVideoResList!.isNotEmpty?(e.vocabularyVideoResList?[0].videoLocation ?? ""):"",
                  e.vocabularyImageResList!.isNotEmpty?(e.vocabularyImageResList?[0].imageLocation ?? ""):"",
                  e.vocabularyImageResList ?? [],
                  e.vocabularyVideoResList ?? [],
                ))
            .toList(),
      );
    }
    return const SizedBox.shrink();
  }
}
