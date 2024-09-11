import 'package:flutter/material.dart';
import 'package:flutter_app/modules/home/bloc/vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/home/page/action_study_widget.dart';
import 'package:flutter_app/modules/home/page/banner.dart';
import 'package:flutter_app/modules/home/page/home_header.dart';
import 'package:flutter_app/modules/home/widget/card_widget.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const BannerCustom(),
                  const SizedBox(height: 24),
                  const ActionStudyDisplay(),
                  const SizedBox(height: 32),
                  Text(
                    'KHÁM PHÁ',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<VocabularyByTopicCubit, VocabularyByTopicState>(
                    builder: (context, state) {
                      if (state is VocabularyByTopicLoadingState) {
                        return const CardWidget(vocabularyModel: null);
                      }
                      if (state is VocabularyByTopicLoadedState) {
                        return CardWidget(
                            vocabularyModel: state.vocabularyModel);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final Size size;
  const Indicator({super.key, required this.isActive, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? size.width * 0.3 : size.width * 0.1,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
