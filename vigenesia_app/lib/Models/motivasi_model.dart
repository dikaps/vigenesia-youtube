import 'dart:convert';

List<MotivasiModel> motivasiModelFromJson(String str) =>
    List<MotivasiModel>.from(
        json.decode(str).map((x) => MotivasiModel.fromJson(x)));

String motivasiModelToJson(List<MotivasiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MotivasiModel {
  MotivasiModel({
    this.id,
    this.isiMotivasi,
    this.idUser,
    this.nama,
    this.tanggalInput,
    this.tanggalUpdate,
    this.likes,
  });

  String id;
  String isiMotivasi;
  String idUser;
  String nama;
  DateTime tanggalInput;
  String tanggalUpdate;
  String likes;

  factory MotivasiModel.fromJson(Map<String, dynamic> json) => MotivasiModel(
        id: json['id'],
        isiMotivasi: json['isi_motivasi'],
        idUser: json['iduser'],
        nama: json['nama'],
        tanggalInput: DateTime.parse(json["tanggal_input"]),
        tanggalUpdate: json['tanggal_update'],
        likes: json['likes'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isi_motivasi": isiMotivasi,
        "iduser": idUser,
        "nama": nama,
        "tanggal_input":
            "${tanggalInput.year.toString().padLeft(4, '0')}-${tanggalInput.month.toString().padLeft(2, '0')}-${tanggalInput.day.toString().padLeft(2, '0')}",
        "tanggal_update": tanggalUpdate,
        "likes": likes,
      };
}
