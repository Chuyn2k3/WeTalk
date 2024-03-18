// import 'package:appdemo/data/term/app_term.dart';
// import 'package:appdemo/modules/employee/model/employee_model.dart';
// import 'package:appdemo/modules/notification/model/notification_model.dart';
// import 'package:appdemo/themes/app_color.dart';
// import 'package:appdemo/utils/time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNotification extends StatelessWidget {
  //final List<NotificationData> notification;
  //final List<EmployeeData> employees;
  const ShowNotification({
    super.key,
    //required this.notification, required this.employees
  });

  // String getUserNotification(int userId) {
  //   String name = '';
  //   for (EmployeeData employee in employees) {
  //     if (employee.id == userId) {
  //       name = employee.displayname;
  //       break;
  //     }
  //   }
  //   return name;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        // (notification.isEmpty)
        //     ? Container(
        //         margin: const EdgeInsets.only(top: 40),
        //         child: const Text('hehe'))
        //     :
        ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                //alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      //height: size.height * 0.05,
                      //width: size.height * 0.02,
                      //constraints: ,
                      decoration: BoxDecoration(
                          //color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      //color: Colors.black,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            //backgroundColor: ,
                              backgroundImage: AssetImage('assets/images/anh_CV.jpg'),radius: 50),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Chuyên',
                                    style: AppTextStyles.notification),
                                Text('đã gửi cho bạn lời mời kết bạn',
                                    style: AppTextStyles.notification)
                              ])
                          // ListTile(
                          //   title: Text('User $index'),
                          //   subtitle: Text('Last message $index'),
                          //   onTap: () {
                          //     openChatScreen(context);
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    // Container(
                    //     padding: const EdgeInsets.all(13),
                    //     width: 300,
                    //     decoration: const BoxDecoration(
                    //         color: Color.fromARGB(255, 205, 203, 202),
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10))),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //             'Thời gian: )}'),
                    //         const SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //             'Nội dung: }'),
                    //         const SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //             'Người gửi: ')
                    //       ],
                    //     )),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              );
            });
  }
}
