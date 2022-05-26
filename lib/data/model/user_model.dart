class UserModel {
  String id;
  String nama;
  String alamat;
  String date;

  UserModel(
      {required this.id,
      required this.nama,
      required this.alamat,
      required this.date});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      nama: json["nama"],
      alamat: json["alamat"],
      date: json["date"]);
}

class UserModelDelete {
  String message;

  UserModelDelete({required this.message});

  factory UserModelDelete.fromJson(Map<String, dynamic> json) =>
      UserModelDelete(message: json["message"]);
}

class UserModelEdit {
  String message;

  UserModelEdit({required this.message});

  factory UserModelEdit.fromJson(Map<String, dynamic> json) =>
      UserModelEdit(message: json["message"]);
}
