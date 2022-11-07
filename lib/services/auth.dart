import 'package:bhawan_app/services/database_laundry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_auth.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth? _userFromFirebaseUser(User? user) {
    return user != null ? UserAuth(uid: user.uid) : null;
  }

  Stream<UserAuth?> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  Future register(String email, String password, String name, String enrollment_number, String room_number, String bhawan, String branch, String role) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if(user != null){
        await DatabaseService(uid: user.uid).updateUserData(email, name, bhawan, room_number, enrollment_number, branch,role);
        await DataBaseLaundry(uid: user.uid,bhawan: bhawan).updateData(name,room_number, '', false);
      }
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}