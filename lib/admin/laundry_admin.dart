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
      body: LaundryAdminPage(),
    );
  }
}
