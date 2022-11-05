import 'package:bhawan_app/screens/homePage.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';

class Decider extends StatelessWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAuth?>(context);
    final userData = Provider.of<UserDataGlobal?>(context);

    if(userData==null)
      return Loading();
    else
      return HomePage();
  }
}

