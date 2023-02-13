class LaporanModel {
  final String id;
  final String nama;
  final String harga;
  final String jumlah_post;
  final String total_harga;

  const LaporanModel({required this.id, required this.nama, required this.harga, required this.jumlah_post, required this.total_harga});

  factory LaporanModel.fromJson(Map<String, dynamic> json) {
    return LaporanModel(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      jumlah_post: json['jumlah_post'],
      total_harga: json['total_harga'],
    );
  }
}
