import 'package:fluttervocabulary/provider/words_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<WordsProvider>(WordsProvider());
}
