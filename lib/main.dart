import 'package:bottom_sheet_persistent/widget/question_sheet_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Persistent BottomSheet';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> questions = <String>[
    'Do you like swimming?',
    'Do you like reading?',
    'Do you like dancing?',
  ];

  int question = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.open_in_new),
              onPressed: () => setState(() => question = 0),
            ),
          ],
        ),
        bottomSheet: question != -1
            ? BottomSheetWidget(
                title: questions[question],
                onClickedYes: () {
                  setState(() {
                    if (question >= questions.length - 1) {
                      question = -1;
                    } else {
                      question++;
                    }
                  });
                },
                onClickedNo: () {
                  setState(() {
                    question = -1;
                  });
                },
              )
            : Container(height: 0),
      );
}
