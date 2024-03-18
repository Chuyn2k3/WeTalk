import 'package:flutter/material.dart';

class YourPopupContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "This is your popup content",
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Close"),
        ),
      ],
    );
  }
}
class CenteredPopup extends StatelessWidget {
  final Widget child;

  const CenteredPopup({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.black.withOpacity(0.5),
              alignment: Alignment.center,
            ),
          ),
        ),
        Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

void showCenteredPopup(BuildContext context, Widget content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CenteredPopup(child: content);
    },
  );
}