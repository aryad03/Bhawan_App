import 'package:bhawan_app/models/user_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Data');

  Future updateUserData(String email, String name, String bhawan, String room_number, String enrollmnet_number, String branch,String role) async{
    return await userCollection.doc(uid).set({
      'name': name,
      'bhawan': bhawan,
      'room_number': room_number,
      'enrollment_number': enrollmnet_number,
      'email': email,
      'branch': branch,
      'role': role,
    });
  }

  UserDataGlobal _dataCollectionFromSnapshot(DocumentSnapshot snapshot){
    // print(snapshot['role']);
    return UserDataGlobal(
        name: snapshot['name'],
        bhawan: snapshot['bhawan'],
        room_number: snapshot['room_number'],
        enrollment_number: snapshot['enrollment_number'],
        email: snapshot['email'],
        branch: snapshot['branch'],
      role: snapshot['role']
    );
  }

  Stream<UserDataGlobal> get userInformation{
    return userCollection.doc(uid).snapshots()
    .map(_dataCollectionFromSnapshot);
  }
  //
  // Stream<List<UserData1>> get data{
  //   return userCollection.snapshots()
  //       .map(_collectionFromSnapshot);
  // }
  //
  // Stream<DocumentSnapshot> get userData{
  //   return userCollection.doc(uid).snapshots();
  // }
}