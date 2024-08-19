import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextTitle.dart';

class IconLogOut extends IconButton {
  IconLogOut({Key? key})
      : super(
          key: key,
          onPressed: () {
            // Auth().signOut();
          },
          icon: Icon(Icons.logout),
        );
}
