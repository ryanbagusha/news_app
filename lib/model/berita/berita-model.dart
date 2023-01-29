class BeritaModel {
  final String id;
  final String judul;
  final String isi;
  final String tanggal;
  final String media;

  const BeritaModel(
      {required this.id,
      required this.judul,
      required this.isi,
      required this.tanggal,
      required this.media});

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      judul: json['judul'],
      isi: json['isi'],
      tanggal: json['tanggal'],
      media: json['media'],
    );
  }
}
