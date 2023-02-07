class TagModel {
  final String id;
  final String nama;
  final String deskripsi;

  const TagModel({required this.id, required this.nama, required this.deskripsi});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
    );
  }
}
