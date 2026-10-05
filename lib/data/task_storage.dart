import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

/// Titik akses data tugas.
///
/// Starter memakai memori agar aplikasi dapat langsung dijalankan. Lengkapi
/// TODO 2 dengan SharedPreferences dan JSON; jangan memindahkan akses storage
/// ke widget.
class TaskStorage {
  TaskStorage({this.loadDelay = const Duration(milliseconds: 450)});

  static const String _tasksKey = 'tasks';

  final Duration loadDelay;

  Future<List<Task>> load({bool simulateError = false}) async {
    await Future<void>.delayed(loadDelay);

    if (simulateError) {
      throw const FormatException('Simulasi data tersimpan yang rusak.');
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? jsonString = prefs.getString(_tasksKey);

    // Jika belum ada data tersimpan, kembalikan list kosong.
    if (jsonString == null || jsonString.isEmpty) {
      return <Task>[];
    }

    // Jika JSON rusak, jsonDecode akan menghasilkan FormatException.
    final dynamic decoded = jsonDecode(jsonString);

    if (decoded is! List) {
      throw const FormatException('Format data tugas tidak valid.');
    }

    return decoded
        .map(
          (dynamic item) => Task.fromJson(
            Map<String, dynamic>.from(item as Map),
          ),
        )
        .toList();
  }

  Future<void> save(List<Task> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String jsonString = jsonEncode(
      tasks.map((Task task) => task.toJson()).toList(),
    );

    final bool success = await prefs.setString(_tasksKey, jsonString);

    if (!success) {
      throw const FormatException('Data tugas gagal disimpan.');
    }
  }

  Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tasksKey);
  }

  /// Hanya untuk mengisolasi pengujian lokal.
  static void resetMemoryForTest() {}
}