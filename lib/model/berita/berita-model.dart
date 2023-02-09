class BeritaModel {
  final String id;
  final String judul;
  final String isi;
  final String tanggal;
  final String media;
  final String totalView;
  final String kategori;
  final String tag;
  final String type;
  final String user;

  const BeritaModel({
    required this.id,
    required this.judul,
    required this.isi,
    required this.tanggal,
    required this.media,
    required this.totalView,
    required this.kategori,
    required this.tag,
    required this.type,
    required this.user,
  });

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
      tanggal: json['tanggal'],
      media: json['media'],
      totalView: json['totalView'],
      kategori: json['kategori'],
      tag: json['tag'],
      type: json['type'],
      user: json['user'],
    );
  }
}
