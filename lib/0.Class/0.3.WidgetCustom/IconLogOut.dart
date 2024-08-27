import 'package:flutter/material.dart';
import 'package:mygesture/0.Class/0.2.Configuration/MasterProvider.dart';
import 'package:mygesture/0.Class/0.1.Element/0.1.1.master/configuration/m_func.dart';

class IconLogOut extends IconButton {
  IconLogOut({Key? key})
      : super(
          key: key,
          onPressed: () {
            MasterProvider.provider.logOut();
          },
          icon: Icon(Icons.logout),
        );
}
