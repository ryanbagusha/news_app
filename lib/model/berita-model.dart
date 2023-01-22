class BeritaModel {
  final String id;
  final String judul;
  final String tanggal;
  final String media;

  const BeritaModel(
      {required this.id,
      required this.judul,
      required this.tanggal,
      required this.media});

  factory BeritaModel.fromJson(Map<String, dynamic> json) {
    return BeritaModel(
      id: json['id'],
      judul: json['judul'],
      tanggal: json['tanggal'],
      media: json['media'],
    );
  }
}
