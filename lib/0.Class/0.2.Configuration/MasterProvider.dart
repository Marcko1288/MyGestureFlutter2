import 'package:flutter/widgets.dart';
import 'package:mygesture/9.Library/master.dart';
import 'package:provider/provider.dart';

class MasterProvider {
  static late Master provider;

  void init(BuildContext context) {
    provider = Provider.of<Master>(context, listen: false);
  }
}
