import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/modules/study/widget/letters_alphabet.dart';
import 'package:flutter_app/modules/study/widget/play_video.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberScreen extends StatefulWidget {
  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  Future<ListResult?> getLink() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("videos/Chữ số/");
    final listResult = await storageRef.listAll();
    return listResult;
  }

  ListResult? link;
  void get() async {
    link = (await getLink())!;
  }

  @override
  void initState() {
    super.initState();
    get();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Bảng chữ số')),
      body: SafeArea(
          child: Column(
        children: [
          Gap(size.height * 0.01),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/images/numbers.jpg'),
          ),
          Gap(size.height * 0.01),
          Text('Ấn vào để xem video hướng dẫn',style:  GoogleFonts.lato( fontSize: size.width*0.04),),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(30),
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              crossAxisCount: 4, // Number of columns
              children: List.generate(Number_List!.length, (index) {
                return InkWell(
                  child: Letter(image: Number_List![index], size: size),
                  onTap: () {
                    //print(link!.items);
                    //  print(link!.items[0].fullPath);
                    //if(link!.items.isNotEmpty)
                    if (link != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        //print(link!.items[0].fullPath);
                        return AlertDialog(
                          //backgroundColor: Colors.white.withOpacity(1.5),
                          elevation: 0,
                          content: PlayVideo(
                              videoUrl: link!.items[index].fullPath ?? ''),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );

                        //PlayVideo(videoUrl: link!.items[index].fullPath ?? '');
                      }));
                    }
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    //   //print(link!.items[0].fullPath);
                    //   return PlayVideo(
                    //       videoUrl: link!.items[0].fullPath ?? '');
                    // }));
                  },
                );
                
                //Letter(image: Number_List![index], size: size);
              }).toList(),
            ),
          )
        ],
      )),
    );
  }
}
