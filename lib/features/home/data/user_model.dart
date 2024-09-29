class UserModel{
  int? page;
  List<dynamic>? userData;
  UserModel.fromJson(json){
    page = json['page'];
    userData = json['data'].map((e) => UserDataModel.fromJson(e)).toList();
  }
}
class UserDataModel{
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageLink;
  UserDataModel.fromJson(json){
    id = json["id"] ;
    firstName = json["first_name"];
    lastName= json["last_name"];
    email=json['email'];
    imageLink = json["avatar"] ;
  }
}