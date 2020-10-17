import 'dart:math';
import 'package:fluttervocabulary/model/Service/my_api.dart';
import 'package:fluttervocabulary/model/glitch/no_internet_glitch.dart';
import 'package:fluttervocabulary/model/glitch/glitch.dart';
import 'package:dartz/dartz.dart';

class WordsHelper {
  final api = MyApi();

  Future<Either<Glitch, String>> getRandomWords() async {
    final apiResult = await api.getWords();

    return apiResult.fold((l) {
      return Left(NoInternetGlitch());
    }, (r) {
      Random rand = new Random();
      int i = rand.nextInt(30);
      final word = r[i];
      return Right(word);
    });
  }

}
