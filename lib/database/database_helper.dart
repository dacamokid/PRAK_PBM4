import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/mahasiswa.dart';

class DatabaseHelper {

  static const String key = "data_mahasiswa";

  // AMBIL SEMUA DATA
  static Future<List<Mahasiswa>> getData() async {

    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(key) ?? [];

    return data.map((e) {

      return Mahasiswa.fromMap(
        jsonDecode(e),
      );

    }).toList();
  }

  // SIMPAN DATA
  static Future<void> tambahData(
    Mahasiswa mahasiswa,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    List<String> data =
        prefs.getStringList(key) ?? [];

    data.add(
      jsonEncode(
        mahasiswa.toMap(),
      ),
    );

    await prefs.setStringList(key, data);
  }

  // UPDATE DATA
  static Future<void> updateData(
    Mahasiswa mahasiswa,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    List<Mahasiswa> list =
        await getData();

    int index = list.indexWhere(
      (e) => e.id == mahasiswa.id,
    );

    list[index] = mahasiswa;

    List<String> hasil =
        list.map((e) {

      return jsonEncode(e.toMap());

    }).toList();

    await prefs.setStringList(key, hasil);
  }

  // HAPUS DATA
  static Future<void> hapusData(
    int id,
  ) async {

    final prefs = await SharedPreferences.getInstance();

    List<Mahasiswa> list =
        await getData();

    list.removeWhere(
      (e) => e.id == id,
    );

    List<String> hasil =
        list.map((e) {

      return jsonEncode(e.toMap());

    }).toList();

    await prefs.setStringList(key, hasil);
  }
}