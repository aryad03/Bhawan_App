import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/appBar.dart';
import 'laundry_admin_home.dart';

class TemplateAdmin extends StatefulWidget {
  const TemplateAdmin({Key? key}) : super(key: key);

  @override
  State<TemplateAdmin> createState() => _TemplateAdminState();
}

class _TemplateAdminState extends State<TemplateAdmin> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50.0),
    child: AppBar(
      title: const Text('Bhawan App'),
      leading: Icon(Icons.arrow_back),
      backgroundColor: Colors.purple,
        actions: <Widget>[
      TextButton.icon(
        icon: Icon(Icons.person),
        label: Text('logout'),
        onPressed: () async {
          await _auth.signOut();
        },
      ),]
    )
    ),
      body: LaundryAdminPage(),
    );
  }
}
