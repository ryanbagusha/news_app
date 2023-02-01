class RoleModel {
  final String id;
  final String nama;

  const RoleModel({required this.id, required this.nama});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
