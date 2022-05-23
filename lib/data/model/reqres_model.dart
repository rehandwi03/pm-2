class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"]);
}

class User {
  Data data;

  User({required this.data});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(data: Data.fromJson(json["data"]));
}
