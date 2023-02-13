class RoleModel {
  final String id;
  final String nama;
  final String harga;

  const RoleModel({required this.id, required this.nama, required this.harga});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
    );
  }
}
