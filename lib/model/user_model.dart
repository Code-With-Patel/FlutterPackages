class UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserModel({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

  factory UserModel.fromJson(Map<String,dynamic> json)=>UserModel(id: json["id"], email: json['email'], firstName: json["first_name"], lastName: json["last_name"], avatar: json["avatar"]);
}
