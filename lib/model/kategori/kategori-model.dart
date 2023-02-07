class KategoriModel {
  final String id;
  final String nama;
  final String deskripsi;

  const KategoriModel({required this.id, required this.nama, required this.deskripsi});

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
    );
  }
}
