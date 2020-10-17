import 'package:after_layout/after_layout.dart';
import 'package:fluttervocabulary/model/glitch/no_internet_glitch.dart';
import 'package:fluttervocabulary/provider/words_provider.dart';
import 'package:flutter/material.dart';

import '../get_it.dart';

class WordsList extends StatefulWidget {
  @override
  _WordsListState createState() => _WordsListState();
}

class _WordsListState extends State<WordsList> with AfterLayoutMixin {
  final provider = getIt<WordsProvider>();

  List<String> wordsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                wordsList.clear();
                provider.refreshGird();
              },
            )
          ],
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
          title: new Text('Vocabulary'),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: wordsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color:
                          index % 2 == 0 ? Colors.grey[200] : Colors.grey[300],
                      child: Text(wordsList[index]),
                    );
                  }),
            ),
            _StartLessonButton(),
          ],
        )
        );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    provider.getTwentyRandomWords();

    provider.wordsStream.listen((snapshot) {
      snapshot.fold((l) {
        if (l is NoInternetGlitch) {
          wordsList.add("Unable to Connect");
        }
      },
          (r) => {
                wordsList.add(r),
              });
      setState(() {});
    });
  }
}


class _StartLessonButton extends StatelessWidget {


  const _StartLessonButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FlatButton(
      onPressed: () {},
      color: Colors.blue,
      splashColor: Theme.of(context).primaryColor,
      child: Center(child: Text('Start lesson',
        style: TextStyle(color: Colors.white,
        fontSize: 18),
      )),
    );
  }
}

