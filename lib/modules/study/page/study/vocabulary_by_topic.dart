import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/bloc/list_vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/study/page/study/vocaubulary.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VocabularyByTopic extends StatefulWidget {
  const VocabularyByTopic({super.key, required this.topicId});
  final int topicId;
  @override
  State<VocabularyByTopic> createState() => _VocabularyByTopicState();
}

class _VocabularyByTopicState extends State<VocabularyByTopic> {
  @override
  Widget build(BuildContext context) {
    context
        .read<ListVocabularyByTopicCubit>()
        .getListVocabularyByTopic(widget.topicId);
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Từ vựng",
        onTap: () => Navigator.pop(context),
      ),
      body: BlocBuilder<ListVocabularyByTopicCubit, ListVocabularyByTopicState>(
        builder: (context, state) {
          if (state is ListVocabularyByTopicLoadedState) {
            return VocabularyScreen(listVocabulary: state.lstvocabulary);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
