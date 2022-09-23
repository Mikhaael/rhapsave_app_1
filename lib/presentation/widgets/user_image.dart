import 'package:flutter/material.dart';

import '../core/assets.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Image.asset(
        Assets.user,
      ),
    );
  }
}
