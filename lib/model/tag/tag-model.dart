class TagModel {
  final String id;
  final String nama;

  const TagModel({required this.id, required this.nama});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
