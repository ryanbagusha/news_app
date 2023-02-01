class KategoriModel {
  final String id;
  final String nama;

  const KategoriModel({required this.id, required this.nama});

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['id'],
      nama: json['nama'],
    );
  }
}