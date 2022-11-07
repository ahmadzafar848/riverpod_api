class AlbumModel {
  int? userId;
  int? id;
  String? title;

  AlbumModel({
    this.userId,
    this.id,
    this.title,
  });

  AlbumModel.fromMap(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
