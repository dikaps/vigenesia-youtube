class LikeModel {
  LikeModel({
    this.id,
    this.idMotivasi,
    this.idUser,
    this.likes,
  });

  final String id;
  final String idMotivasi;
  final String idUser;
  final String likes;

  factory LikeModel.fromJson(Map<String, dynamic> json) => LikeModel(
        id: json["id"],
        idMotivasi: json["id_motivasi"],
        idUser: json["id_user"],
        likes: json["likes"],
      );
}
