import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimestampChangeNotifier extends ChangeNotifier {
  String _timestamp = "";
  String get timestamp => _timestamp;

  void generateTimestamp() {
    var dt = DateTime.now();
    _timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(dt); // 31/12/2000, 22:00

    notifyListeners();
  }

  void clearTimestamp() {
    _timestamp = "";

    notifyListeners();
  }
}
