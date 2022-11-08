import 'package:bhawan_app/admin/EntryExitAdminHome.dart';
import 'package:bhawan_app/admin/laundry_admin.dart';
import 'package:bhawan_app/screens/homePage.dart';
import 'package:bhawan_app/services/database_laundry.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';

class Decider extends StatelessWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAuth>(context);
    final userData = Provider.of<UserDataGlobal?>(context);
    // print(userData!.role);
    if(userData==null)
      return Loading();
    else if(userData.role=='Student')
      return HomePage();
    else if(userData.role=='Laundry Man')
      return StreamProvider<List<UserLaundry>?>.value(
          initialData: null,
          value: DataBaseLaundry(uid: user!.uid,bhawan: userData.bhawan).users,
          child: TemplateAdmin()
      );
    else if(userData.role=='Guard') {
      return Admin_Entry();
    }
    else{
      return Container();
    }
  }
}