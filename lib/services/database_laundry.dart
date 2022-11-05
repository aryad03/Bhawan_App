import 'package:bhawan_app/models/user_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseLaundry{

  final String? uid;
  final String? bhawan;

  DataBaseLaundry({this.uid, this.bhawan});

  final CollectionReference laundrymanagement = FirebaseFirestore.instance.collection('Laundry Management');

  Future updateData(String name,String roomnumber, String clothes,bool inprocess) async {
    return await laundrymanagement.doc('new').collection(bhawan!).doc(uid!).set({
      'name': name,
      'roomnumber': roomnumber,
      'clothes': clothes,
      'inprocess': inprocess,
    });
  }

  Future adminUpdate(bool inprocess) async{
    return await laundrymanagement.doc('new').collection(bhawan!).doc(uid!).set({
      'inprocess': inprocess
    });
  }

  List<UserLaundry> _convert(QuerySnapshot snapshot){
    return snapshot.docs.map((docs){
      // print(docs.id);
      return UserLaundry(inproccess: docs['inprocess'], clothes: docs['clothes'], roomnumber: docs['roomnumber'],id: docs.id);
    }).toList();
  }

  UserLaundry _docToUser(DocumentSnapshot snapshot){
    print(snapshot.id);
    return UserLaundry(roomnumber: snapshot['roomnumber'], clothes: snapshot['clothes'], inproccess: snapshot['inprocess'], id: snapshot.id);
  }

  Stream<UserLaundry> get userdatalaundry{
    return laundrymanagement.doc('new').collection(bhawan!).doc(uid!).snapshots().map(_docToUser);
  }

  Stream<List<UserLaundry>> get users{
    final CollectionReference list = laundrymanagement.doc('new').collection(bhawan!);
    return list.snapshots().map(_convert);
  }
}

class UserCustom{
  String roomnumber;
  String clothes;
  bool inprocess;
  String id;

  UserCustom({required this.inprocess,required this.clothes,required this.roomnumber,required this.id});
}

