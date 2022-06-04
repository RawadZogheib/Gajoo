import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/PopUp/errorWarningPopup.dart';
import 'package:gajoo/widgets/button/myButton.dart';
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
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

  final List<String> _answerList = [];

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
        _nextQuestion('TimeOut');
      } else {
        setState(() {
          _currentTimer++;
          debugPrint('$_currentTimer Second');
        });
      }
    });
  }

  _nextQuestion(String val) {
    debugPrint(val);
    _answerList.add(val);
    if (_iterator < _getTestList(widget.index).length - 1) {
      setState(() {
        _iterator++;
        _currentTimer = 0;
      });
    } else {
      debugPrint(_answerList.toString());
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
            key: const ValueKey(1),
            questionId: 1,
            question: '1. Je sais me présenter?',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(2.1),
            questionId: 2.1,
            question: '2.1. Je sais lire les phrases suivantes:',
            question2: 'Léo a bu de la limonade.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(2.2),
            questionId: 2.2,
            question: '2.2. Je sais lire les phrases suivantes:',
            question2: 'Matou roule partout à moto.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(2.3),
            questionId: 2.3,
            question: '2.3. Je sais lire les phrases suivantes:',
            question2: 'Charles aime faire du sport.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(2.4),
            questionId: 2.4,
            question: '2.4. Je sais lire les phrases suivantes:',
            question2: 'Marie-Madeleine a peur du noir.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(3.1),
            questionId: 3.1,
            question: '3.1. Je choisis « Vrai » ou « Faux »:',
            question2: 'La limonade est un jus.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(3.2),
            questionId: 3.2,
            question: '3.2. Je choisis « Vrai » ou « Faux »:',
            question2: 'La moto est un moyen de transport aérien.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(3.3),
            questionId: 3.3,
            question: '3.3. Je choisis « Vrai » ou « Faux »:',
            question2: 'Le sport est indispensable pour rester en bonne forme.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(3.4),
            questionId: 3.4,
            question: '3.4. Je choisis « Vrai » ou « Faux »:',
            question2: 'La peur est une émotion agréable.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget2(
            key: const ValueKey(4),
            questionId: 4,
            question: '4. J’écris ce que je vois:',
            pronomIndefini: 'Un',
            asset: 'Assets/Quiz/FR/avion.png',
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget3(
            key: const ValueKey(5),
            questionId: 5,
            question: '5. Je choisis la bonne image:',
            desc: 'Il joue au ballon.',
            asset1: 'Assets/Quiz/FR/footBall.png',
            asset2: 'Assets/Quiz/FR/notFootBall.png',
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget(
            key: const ValueKey(6),
            questionId: 6,
            question:
                '6. Je choisis l’étiquette convenable pour compléter la phrase:',
            question2: 'Sara écrit________',
            ansList: const ['au tableau.', 'au tablo.', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget4(
            key: const ValueKey(7),
            questionId: 7,
            question: '7. Je mets les lettres en ordre pour trouver le mot:',
            letters: 'e – b – a – r – c – l – a – t',
            pronomIndefini: 'Un',
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget4(
            key: const ValueKey(8),
            questionId: 8,
            question: '8. Je mets les syllabes en ordre:',
            letters: 're - cou - tu - ver',
            pronomIndefini: 'Une',
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget4(
            key: const ValueKey(9),
            questionId: 9,
            question: '9. Je mets les mots en ordre pour trouver la phrase:',
            letters: 'va - Nadine - l’école - mère - avec - à - sa',
            pronomIndefini: '',
            onTap: (String val) => _nextQuestion(val),
          ),
          QCUWidget5(
            key: const ValueKey(10),
            questionId: 10,
            question: '10.Je choisis la bonne réponse:',
            question2: 'L’enfant a vu ',
            asset: 'Assets/Quiz/FR/mer.png',
            ansList: const ['la mer. ', 'la mère.', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
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
  Function(String value) onTap;

  QCUWidget(
      {Key? key,
      required this.questionId,
      required this.question,
      this.question2 = '',
      required this.ansList,
      required this.onTap})
      : super(key: key);

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
    // Save Answer
    widget.onTap(val);
  }
}

class QCUWidget2 extends StatefulWidget {
  double questionId;
  String question;
  String pronomIndefini;
  String asset;
  Function(String value) onTap;

  QCUWidget2(
      {Key? key,
      required this.questionId,
      required this.question,
      required this.pronomIndefini,
      required this.asset,
      required this.onTap})
      : super(key: key);

  @override
  State<QCUWidget2> createState() => _QCUWidget2State();
}

class _QCUWidget2State extends State<QCUWidget2> {
  String _typedText = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, //300
      width: MediaQuery.of(context).size.width * 0.7, //400
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Text(
                widget.question,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.asset,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                children: [
                  Text(
                    widget.pronomIndefini,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Expanded(
                    child: myTextInput3(
                      initialValue: '',
                      textString: 'Your Answer',
                      labelText: '',
                      spaceAllowed: true,
                      enterAllowed: false,
                      obscure: false,
                      colBlue: globals.whiteBlue,
                      colBlue_1: Colors.red,
                      colBlue_2: Colors.red,
                      onChange: (value) {
                        _typedText = value;
                        debugPrint(value);
                      },
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  MyBtn3(
                    btnText: 'Next',
                    height: 70,
                    width: 100,
                    onPress: () => _onTap(_typedText),
                    color1: Colors.red,
                    color2: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTap(String val) {
    // Save Answer
    widget.onTap(val);
  }
}

class QCUWidget3 extends StatefulWidget {
  double questionId;
  String question;
  String desc;
  String asset1;
  String asset2;
  Function(String value) onTap;

  QCUWidget3(
      {Key? key,
      required this.questionId,
      required this.question,
      required this.desc,
      required this.asset1,
      required this.asset2,
      required this.onTap})
      : super(key: key);

  @override
  State<QCUWidget3> createState() => _QCUWidget3State();
}

class _QCUWidget3State extends State<QCUWidget3> {
  final String _typedText = '';

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
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _onTap(widget.asset1),
                    child: Image.asset(
                      widget.asset1,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  InkWell(
                    onTap: () => _onTap(widget.asset2),
                    child: Image.asset(
                      widget.asset2,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  MyBtn3(
                    btnText: 'Pas de réponses',
                    height: 70,
                    width: 100,
                    onPress: () => _onTap('Pas de réponse'),
                    color1: Colors.red,
                    color2: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTap(String val) {
    // Save Answer
    widget.onTap(val);
  }
}

class QCUWidget4 extends StatefulWidget {
  double questionId;
  String question;
  String letters;
  String pronomIndefini;
  Function(String value) onTap;

  QCUWidget4(
      {Key? key,
      required this.questionId,
      required this.question,
      required this.letters,
      required this.pronomIndefini,
      required this.onTap})
      : super(key: key);

  @override
  State<QCUWidget4> createState() => _QCUWidget4State();
}

class _QCUWidget4State extends State<QCUWidget4> {
  String _typedText = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, //300
      width: MediaQuery.of(context).size.width * 0.7, //400
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Text(
                widget.question,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.letters,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                children: [
                  Text(
                    ' → ${widget.pronomIndefini} ',
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Expanded(
                    child: myTextInput3(
                      initialValue: '',
                      textString: 'Your Answer',
                      labelText: '',
                      spaceAllowed: true,
                      enterAllowed: false,
                      obscure: false,
                      colBlue: globals.whiteBlue,
                      colBlue_1: Colors.red,
                      colBlue_2: Colors.red,
                      onChange: (value) {
                        _typedText = value;
                        debugPrint(value);
                      },
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  MyBtn3(
                    btnText: 'Next',
                    height: 70,
                    width: 100,
                    onPress: () => _onTap(_typedText),
                    color1: Colors.red,
                    color2: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTap(String val) {
    // Save Answer
    widget.onTap(val);
  }
}

class QCUWidget5 extends StatefulWidget {
  double questionId;
  String question;
  String question2;
  String asset;
  List<String> ansList;
  Function(String value) onTap;

  QCUWidget5(
      {Key? key,
      required this.questionId,
      required this.question,
      required this.question2,
      required this.asset,
      required this.ansList,
      required this.onTap})
      : super(key: key);

  @override
  State<QCUWidget5> createState() => _QCUWidget5State();
}

class _QCUWidget5State extends State<QCUWidget5> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7, //300
      width: MediaQuery.of(context).size.width * 0.7, //400
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Text(
                widget.question,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.asset,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.question2,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
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
        ),
      ),
    );
  }

  _onTap(String val) {
    // Save Answer
    widget.onTap(val);
  }
}