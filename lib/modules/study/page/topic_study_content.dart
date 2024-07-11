import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/study/widget/display_content.dart';

class ContentTopic extends StatelessWidget {
  const ContentTopic({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Text(
          'Động vật',
        )),
        body: GridView.count(
          padding: EdgeInsets.all(8),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: List.generate(5, (index) {
            return Container(

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 173, 170, 170),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('con chó')],),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(),)),
                  child: Text("Display"))
              ],)
            );
          }),
        ));
  }
}
