import 'dart:async';

import 'package:fluttervocabulary/model/glitch/glitch.dart';
import 'package:fluttervocabulary/model/helper/words_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class WordsProvider extends ChangeNotifier {
  final _helper = WordsHelper();


  final _streamController = StreamController<Either<Glitch, String>>();
  Stream<Either<Glitch, String>> get wordsStream {
    return _streamController.stream;
  }

  Future<void> getTwentyRandomWords() async {
    for (int i = 0; i < 20; i++) {
      final helperResult = await _helper.getRandomWords();
      _streamController.add(helperResult);
    }
  }

  void refreshGird() {
    getTwentyRandomWords();
  }
}
