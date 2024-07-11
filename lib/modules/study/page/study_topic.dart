import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/page/topic_study_content.dart';
import 'package:flutter_app/modules/study/widget/topic_list.dart';

class StudyTopic extends StatelessWidget {
  StudyTopic({super.key});
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Học Tập'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchForm(_textEditingController),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContentTopic(),
                            ));
                      },
                      child: TopicStudy(size));
                }),
          )
        ],
      ),
    );
  }

  Widget SearchForm(TextEditingController _textEditingController) {
    return TextFormField(
      //onChanged: search,
      maxLength: 500,
      controller: _textEditingController,
      decoration: const InputDecoration(
          filled: true,
          //fillColor: AppColors.white2,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(width: 0.8),
          ),
          //hintText: AppDeviceTerm.hintTextLookForm,
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(width: 0.8),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(
              width: 4,
              color: Colors.blue,
            ),
          )),
    );
  }
}
