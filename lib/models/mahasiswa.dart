class Mahasiswa {

  int id;
  String nama;
  String ttl;
  String gender;
  String alamat;
  String agama;
  String pendidikan;
  String hp;
  String email;

  Mahasiswa({
    required this.id,
    required this.nama,
    required this.ttl,
    required this.gender,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.hp,
    required this.email,
  });

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'nama': nama,
      'ttl': ttl,
      'gender': gender,
      'alamat': alamat,
      'agama': agama,
      'pendidikan': pendidikan,
      'hp': hp,
      'email': email,
    };
  }

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {

    return Mahasiswa(
      id: map['id'],
      nama: map['nama'],
      ttl: map['ttl'],
      gender: map['gender'],
      alamat: map['alamat'],
      agama: map['agama'],
      pendidikan: map['pendidikan'],
      hp: map['hp'],
      email: map['email'],
    );
  }
}