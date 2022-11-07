class UserAuth{
  final String uid;
  UserAuth({required this.uid});
}

class UserDataGlobal{
  final String name;
  final String bhawan;
  final String room_number;
  final String enrollment_number;
  final String email;
  final String branch;
  final String role;

  UserDataGlobal({required this.email, required this.name, required this.bhawan, required this.room_number, required this.enrollment_number, required this.branch,required this.role});
}

class UserLaundry{
  final String name;
  final String roomnumber;
  final String clothes;
  final bool inproccess;
  final String id;

  UserLaundry({required this.roomnumber,required this.clothes,required this.inproccess,required this.id,required this.name});
}

class UserComplain{
  final String name;
  final String roomnumber;
  final String complaintype;
  final String description;
  final bool inproccess;

  UserComplain({required this.name,required this.roomnumber,required this.complaintype,required this.description,required this.inproccess});

}