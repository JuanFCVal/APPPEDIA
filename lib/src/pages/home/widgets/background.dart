import 'package:flutter/material.dart';

class BackgroundConts extends StatelessWidget {
  const BackgroundConts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.40,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
