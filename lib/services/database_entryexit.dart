import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_auth.dart';

class DatabaseEntryExit{

  final String? uid;
  final String? Bhawan;

  DatabaseEntryExit({this.uid, this.Bhawan});

  final CollectionReference usercollectionentry = FirebaseFirestore.instance.collection('Entry_Exit_Bhawans');

  Future statusUserEntry(String Bhawan, bool status,bool request) async{
    return await usercollectionentry.doc(uid!).set({
      'Bhawan' : Bhawan,
      'status' : status,
      'request': request,
    });
  }

  Future updateDataEntry(String name, String enrollment_number, bool status, bool request) async{
    return await usercollectionentry.doc('new').collection(Bhawan!).doc(uid!).set({
      'name': name,
      'enrollment_number': enrollment_number,
      'status': status,
      'request': request,
    });
  }

  UserEntryExit _userconvert(DocumentSnapshot snapshot){
    // print(snapshot)
    return UserEntryExit(name: snapshot['name'], enrollment_number: snapshot['enrollment_number'], request: snapshot['request'], id: snapshot.id, status: snapshot['status']);
  }

  List<UserEntryExit> _convert(QuerySnapshot snapshot){
    return snapshot.docs.map((docs){
      return UserEntryExit(name: docs['name'], enrollment_number: docs['enrollment_number'], request: docs['request'], id: docs.id, status: docs['status']);
    }).toList();
  }

  // Stream<UserEntryExit> get userdataEntryExit{
  //   return usercollectionentry.doc('new').collection(Bhawan!).doc(uid!).snapshots().map(_docToUser);
  // }

  UserEntryExitStatus _statusconvert(DocumentSnapshot snapshot){
    // print(snapshot['status']);
    return UserEntryExitStatus(Bhawan: snapshot['Bhawan'], status: snapshot['status'],request: snapshot['request']);
  }

  Stream<List<UserEntryExit>> get users{
    return usercollectionentry.doc('new').collection(Bhawan!).snapshots().map(_convert);
  }

  Stream<UserEntryExitStatus> get status{
    return usercollectionentry.doc(uid!).snapshots().map(_statusconvert);
  }

  Stream<UserEntryExit> get user{
    return usercollectionentry.doc('new').collection(Bhawan!).doc(uid).snapshots().map(_userconvert);
  }
}