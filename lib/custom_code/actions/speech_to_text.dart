// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

Future speechToText() async {
  String output = '';
  bool _onDevice = false;
  final TextEditingController _pauseForController =
      TextEditingController(text: '3');
  final TextEditingController _listenForController =
      TextEditingController(text: '30');
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String _currentLocaleId = '';
  final SpeechToText speech = SpeechToText();

  bool isInitialized = await speech.initialize();

  if (isInitialized) {
    var systemLocale = await speech.systemLocale();
    _currentLocaleId = systemLocale?.localeId ?? '';
    final pauseFor = int.tryParse(_pauseForController.text);
    final listenFor = int.tryParse(_listenForController.text);
    speech.listen(
      onResult: (result) {
        if (!result.finalResult) {
          FFAppState().update(() {
            FFAppState().recordButtonText = 'listening...';
            FFAppState().stt = '${result.recognizedWords}';
          });
        } else {
          FFAppState().update(() {
            output = '${result.recognizedWords}';
            FFAppState().transcriptedText = '${result.recognizedWords}';
            FFAppState().recordButtonText = 'Talk';
          });
        }
      },
      listenFor: Duration(seconds: listenFor ?? 30),
      pauseFor: Duration(seconds: pauseFor ?? 3),
      partialResults: true,
      localeId: _currentLocaleId,
      onSoundLevelChange: (level) {
        minSoundLevel = min(minSoundLevel, level);
        maxSoundLevel = max(maxSoundLevel, level);
        print('sound level $level: $minSoundLevel - $maxSoundLevel ');
        level = level;
      },
      cancelOnError: true,
      listenMode: ListenMode.confirmation,
      onDevice: _onDevice,
    );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
