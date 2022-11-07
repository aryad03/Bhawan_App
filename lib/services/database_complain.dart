import 'dart:math';

import 'package:bhawan_app/models/user_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseComplain{
  String uid;
  String bhawan;

  DataBaseComplain({required this.uid,required this.bhawan});


  final CollectionReference complainmanagement = FirebaseFirestore.instance.collection('Complain Management');

  Future updateData(String name,String roomnumber, String complaintype,String description,bool inprocess) async {
    int rand = Random().nextInt(10000);

    return await complainmanagement.doc(bhawan!).collection(uid!).doc(rand.toString()).set({
      'name': name,
      'roomnumber': roomnumber,
      'complaintype': complaintype,
      'description': description,
      'inprocess': inprocess,
    });
  }

  List<UserComplain> _convertToAbstractClass(QuerySnapshot snapshot){
    return snapshot.docs.map((docs) {
      return UserComplain(name: docs['name'],roomnumber: docs['roomnumber'],complaintype: docs['complaintype'],description: docs['description'],inproccess: docs['inprocess']);
    }).toList();
  }

  Stream<List<UserComplain>> get userDataComplain{
    return complainmanagement.doc(bhawan).collection(uid).snapshots().map(_convertToAbstractClass);
  }
}