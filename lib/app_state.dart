import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _stt = 'Record Audio';
  String get stt => _stt;
  set stt(String _value) {
    _stt = _value;
  }

  String _recordButtonText = 'Record Audio';
  String get recordButtonText => _recordButtonText;
  set recordButtonText(String _value) {
    _recordButtonText = _value;
  }

  String _transcriptedText = 'Describe your memory...';
  String get transcriptedText => _transcriptedText;
  set transcriptedText(String _value) {
    _transcriptedText = _value;
  }

  int _increment = 0;
  int get increment => _increment;
  set increment(int _value) {
    _increment = _value;
  }

  String _finalDisplayedText = '';
  String get finalDisplayedText => _finalDisplayedText;
  set finalDisplayedText(String _value) {
    _finalDisplayedText = _value;
  }

  String _finalDisplayedImagePath = '';
  String get finalDisplayedImagePath => _finalDisplayedImagePath;
  set finalDisplayedImagePath(String _value) {
    _finalDisplayedImagePath = _value;
  }

  int _newIndex = 0;
  int get newIndex => _newIndex;
  set newIndex(int _value) {
    _newIndex = _value;
  }

  String _firstbookname = '';
  String get firstbookname => _firstbookname;
  set firstbookname(String _value) {
    _firstbookname = _value;
  }

  String _secondbookname = '';
  String get secondbookname => _secondbookname;
  set secondbookname(String _value) {
    _secondbookname = _value;
  }

  String _thirdbookname = '';
  String get thirdbookname => _thirdbookname;
  set thirdbookname(String _value) {
    _thirdbookname = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
