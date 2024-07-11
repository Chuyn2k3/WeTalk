import 'package:flutter/material.dart';


class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      this.body,
      this.appBar,
      this.background,
      this.resizeToAvoidBottomInset,
      this.bottom});
  final Widget? body;
   final Widget? bottom;
  final Widget? background;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottom,
        body: background ??
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/back_ground.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: (appBar?.preferredSize.height ?? 0) +
                        MediaQuery.of(context).padding.top),
                child: body,
              ),
            ));
  }
}
