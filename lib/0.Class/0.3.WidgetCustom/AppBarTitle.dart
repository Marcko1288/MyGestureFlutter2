import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Struct/ColorsCustom.dart';
import 'package:mygesture/0.Class/0.2.Struct/SizeConfig.dart';
import 'package:mygesture/0.Class/0.3.WidgetCustom/TextTitle.dart';

class AppBarTitle extends StatelessWidget implements PreferredSizeWidget {
  String text;
  IconButton? icon;

  AppBarTitle({required this.text, IconButton? icon})
      : this.icon = icon ?? null;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      centerTitle: true,
      title: TextTitle(title: text),
      actions: [
        if (icon != null)
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 8),
              child: icon,
            )
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
