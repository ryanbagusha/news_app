class KomentarModel {
  final String id;
  final String nama;
  final String komentar;
  final String berita;
  final String user;

  const KomentarModel(
      {required this.id,
      required this.nama,
      required this.komentar,
      required this.berita,
      required this.user});

  factory KomentarModel.fromJson(Map<String, dynamic> json) {
    return KomentarModel(
      id: json['id'],
      nama: json['nama'],
      komentar: json['komentar'],
      berita: json['id_berita'],
      user: json['id_user'],
    );
  }
}
