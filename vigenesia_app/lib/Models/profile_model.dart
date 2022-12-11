import 'dart:convert';
import 'package:date_format/date_format.dart';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(
    jsonDecode(str).map((x) => ProfileModel.fromJson(x)));

String profilModelToJson(List<ProfileModel> data) =>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

class ProfileModel {
  ProfileModel({
    this.iduser,
    this.nama,
    this.profesi,
    this.email,
    this.password,
    this.roleId,
    this.isActive,
    this.tanggalInput,
    this.modified,
    this.likes,
  });

  String iduser;
  String nama;
  String profesi;
  String email;
  String password;
  String roleId;
  String isActive;
  String tanggalInput;
  String modified;
  String likes;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        iduser: json["iduser"],
        nama: json["nama"],
        profesi: json["profesi"],
        email: json["email"],
        password: json["password"],
        roleId: json["role_id"],
        isActive: json["is_active"],
        tanggalInput: formatDate(
            DateTime.parse(json["tanggal_input"]), [d, ' ', M, ' ', yyyy]),
        modified: formatDate(
            DateTime.parse(json["modified"]), [yyyy, '-', M, '-', d]),
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "nama": nama,
        "profesi": profesi,
        "email": email,
        "password": password,
        "role_id": roleId,
        "is_active": isActive,
        "tanggal_input": tanggalInput,
        "modified": modified,
        "likes": likes,
      };
}
