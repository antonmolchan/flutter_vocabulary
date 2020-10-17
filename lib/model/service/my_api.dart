import 'package:dartz/dartz.dart';

class MyApi {
  List<String> words = [
    'laughable',
    'cynical',
    'obsequious',
    'direction',
    'stomach',
    'voice',
    'crowded',
    'accurate',
    'shaky',
    'drip',
    'carriage',
    'best',
    'piquant',
    'oven',
    'end',
    'suspect',
    'library',
    'extra-large',
    'tan',
    'combative',
    'ashamed',
    'joyous',
    'rescue',
    'poison',
    'fumbling',
    'choke',
    'mighty',
    'cherries',
    'table',
    'rainstorm',
  ];


  Future<Either<Exception, List<String>>> getWords() async {
    try {
      return Right(words);
    } catch (e) {
      return (Left(e));
    }
  }
}
