import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/textInput/myTextInput.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _getQuiz();
        },
        label: const Text('Approve'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }

  void _getQuiz() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogQuiz(index: 'FR'),
    ).then((exit) {
      if (mounted) {
        setState(() {
          //_nullTextCode();
        });
      }
    });
  }
}

class AlertDialogQuiz extends StatefulWidget {
  String index;

  AlertDialogQuiz({Key? key, required this.index}) : super(key: key);

  // : maxQuestion = index == 'AR'
  //       ? 13
  //       : index == 'FR'
  //           ? 13
  //           : index == 'FR_DELF'
  //               ? 13
  //               : index == 'EN'
  //                   ? 13
  //                   : 0;

  @override
  _AlertDialogQuizState createState() => _AlertDialogQuizState();
}

class _AlertDialogQuizState extends State<AlertDialogQuiz> {
  Timer? _timer;
  double _currentTimer = 0;
  int _iterator = 0;
  final double _maxTimer = 30;

  @override
  void initState() {
    // TODO: implement initState
    _myTimer();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        )),
        backgroundColor: Colors.red,
        contentPadding:
            const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0, top: 30),
        title: const Center(
          child: Text('_text',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.8, //300
          width: MediaQuery.of(context).size.width * 0.8, //400
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                      overlayShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                    ),
                    child: Slider(
                      value: _currentTimer.toDouble(),
                      max: _maxTimer,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      onChanged: (double value) {},
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _getTestList(widget.index)[_iterator],
              ],
            ),
          ),
        ));
  }

  void _myTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      if (_currentTimer >= _maxTimer) {
        //next question
        _nextQuestion();
      } else {
        setState(() {
          _currentTimer++;
          debugPrint('$_currentTimer Second');
        });
      }
    });
  }

  _nextQuestion() {
    if (_iterator < _getTestList(widget.index).length - 1) {
      setState(() {
        _iterator++;
        _currentTimer = 0;
      });
    } else {
      _timer?.cancel();
      Navigator.pop(context);
      SuccessPopup(context, 'Quiz Finished!');
    }
  }

  List<Widget> _getTestList(String index) {
    List<Widget> _testList =
        []; // ['questionType' ,'questionId', 'question', ['answer1','answer2',...,'answerN']]
    switch (index) {
      case 'AR': // Arabic Test

        break;
      case 'FR': // French Test
        _testList.addAll([
          QCUWidget(
            questionId: 1,
            question: '1. Je sais me présenter?',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 2.1,
            question: '2.1. Je sais lire les phrases suivantes:',
            question2: 'Léo a bu de la limonade.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 2.2,
            question: '2.2. Je sais lire les phrases suivantes:',
            question2: 'Matou roule partout à moto.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 2.3,
            question: '2.3. Je sais lire les phrases suivantes:',
            question2: 'Charles aime faire du sport.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 2.4,
            question: '2.4. Je sais lire les phrases suivantes:',
            question2: 'Marie-Madeleine a peur du noir.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 3.1,
            question: '3.1. Je choisis « Vrai » ou « Faux »:',
            question2: 'La limonade est un jus.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 3.2,
            question: '3.2. Je choisis « Vrai » ou « Faux »:',
            question2: 'La moto est un moyen de transport aérien.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 3.3,
            question: '3.3. Je choisis « Vrai » ou « Faux »:',
            question2: 'Le sport est indispensable pour rester en bonne forme.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget(
            questionId: 3.4,
            question: '3.4. Je choisis « Vrai » ou « Faux »:',
            question2: 'La peur est une émotion agréable.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: () => _nextQuestion(),
          ),
          QCUWidget2(
            questionId: 4,
            question: '4. J’écris ce que je vois :',
            pronomIndefini: 'Un',
            asset: 'Assets/Quiz/FR/avion.png',
            onTap: () => _nextQuestion(),
          ),
        ]);
        break;
      case 'FR_DELF': // French Test (DELF)

        break;
      case 'EN': // English Test

        break;
    }
    return _testList;
  }
}

class QCUWidget extends StatefulWidget {
  double questionId;
  String question;
  String question2;
  List<String> ansList;
  Function onTap;

  QCUWidget(
      {Key? key, required this.questionId,
      required this.question,
      this.question2 = '',
      required this.ansList,
      required this.onTap}) : super(key: key);

  @override
  State<QCUWidget> createState() => _QCUWidgetState();
}

class _QCUWidgetState extends State<QCUWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, //300
      width: MediaQuery.of(context).size.width * 0.7, //400
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Text(
            widget.question,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.question2,
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyBtn3(
                btnText: widget.ansList[0],
                height: 70,
                width: 100,
                onPress: () => _onTap(widget.ansList[0]),
                color1: Colors.red,
                color2: Colors.white,
              ),
              const SizedBox(width: 10),
              MyBtn3(
                btnText: widget.ansList[1],
                height: 70,
                width: 100,
                onPress: () => _onTap(widget.ansList[1]),
                color1: Colors.red,
                color2: Colors.white,
              ),
              const SizedBox(width: 10),
              MyBtn3(
                btnText: widget.ansList[2],
                height: 70,
                width: 100,
                onPress: () => _onTap(widget.ansList[2]),
                color1: Colors.red,
                color2: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }

  _onTap(String val) {
    debugPrint(val);
    widget.onTap();
  }
}

class QCUWidget2 extends StatefulWidget {
  double questionId;
  String question;
  String pronomIndefini;
  String asset;
  Function onTap;

  QCUWidget2(
      {Key? key, required this.questionId,
      required this.question,
      required this.pronomIndefini,
      required this.asset,
      required this.onTap}) : super(key: key);

  @override
  State<QCUWidget2> createState() => _QCUWidget2State();
}

class _QCUWidget2State extends State<QCUWidget2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, //300
      width: MediaQuery.of(context).size.width * 0.7, //400
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Text(
            widget.question,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                widget.pronomIndefini,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyBtn3(
                btnText: widget.asset,
                height: 70,
                width: 100,
                onPress: () => _onTap('widget.assetList[0]'),
                color1: Colors.red,
                color2: Colors.white,
              ),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }

  _onTap(String val) {
    debugPrint(val);
    widget.onTap();
  }
}
