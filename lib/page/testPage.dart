import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gajoo/api/my_api.dart';
import 'package:gajoo/api/my_session.dart';
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
  String quizType = 'FR';
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
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialogQuiz(index: quizType),
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
          child: Text('Quiz',
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
      debugPrint(widget.index);// quizType
      _sendAnswer(widget.index, _answerList);
      // TODO
      // TODO
      // TODO: Send to server
      // TODO
      // TODO
      _timer?.cancel();
      Navigator.pop(context);
      successPopup(context, 'Quiz Finished!');
    }
  }

  _sendAnswer(String quizType, List<String> answerList) async {
    try {
      var data = {
        'version': globals.version,
        'account_Id': await SessionManager().get("Id"),
        'list': answerList,
        'type': quizType
      };

      var res = await CallApi()
          .postData(data, '/Quiz/Control/(Control)quiz.php');

      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if (body[0] == "success") {

        print(body[1]);


      } else if (body[0] == 'error10') {
        warningPopup(context, globals.warning10);
      } else if (body[0] == "errorToken") {
        errorPopup(context, globals.errorToken);
      } else {
        errorPopup(context, globals.errorElse);
      }
    }catch(e){
      print(e);
      errorPopup(context, globals.errorException);
    }
  }

  List<Widget> _getTestList(String index) {
    List<Widget> _testList =
        []; // ['questionType' ,'questionId', 'question', ['answer1','answer2',...,'answerN']]
    switch (index) {
      case 'AR': // Arabic Test
        _testList.addAll([]);
        break;
      case 'FR': // French Test
        _testList.addAll([
          QCUWidget(
            key: const ValueKey(2.1),
            questionId: 2.1,
            question: '2.1. Je sais lire les phrases suivantes:',
            question2: 'Léo a bu de la limonade.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 2
          QCUWidget(
            key: const ValueKey(2.2),
            questionId: 2.2,
            question: '2.2. Je sais lire les phrases suivantes:',
            question2: 'Matou roule partout à moto.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 3
          QCUWidget(
            key: const ValueKey(2.3),
            questionId: 2.3,
            question: '2.3. Je sais lire les phrases suivantes:',
            question2: 'Charles aime faire du sport.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 4
          QCUWidget(
            key: const ValueKey(2.4),
            questionId: 2.4,
            question: '2.4. Je sais lire les phrases suivantes:',
            question2: 'Marie-Madeleine a peur du noir.',
            ansList: const ['Oui', 'Non', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 5
          QCUWidget(
            key: const ValueKey(3.1),
            questionId: 3.1,
            question: '3.1. Je choisis « Vrai » ou « Faux »:',
            question2: 'La limonade est un jus.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 6
          QCUWidget(
            key: const ValueKey(3.2),
            questionId: 3.2,
            question: '3.2. Je choisis « Vrai » ou « Faux »:',
            question2: 'La moto est un moyen de transport aérien.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 7
          QCUWidget(
            key: const ValueKey(3.3),
            questionId: 3.3,
            question: '3.3. Je choisis « Vrai » ou « Faux »:',
            question2: 'Le sport est indispensable pour rester en bonne forme.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 8
          QCUWidget(
            key: const ValueKey(3.4),
            questionId: 3.4,
            question: '3.4. Je choisis « Vrai » ou « Faux »:',
            question2: 'La peur est une émotion agréable.',
            ansList: const ['Vrai', 'Faux', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 9
          QCUWidget2(
            key: const ValueKey(4),
            questionId: 4,
            question: '4. J’écris ce que je vois:',
            pronomIndefini: 'Un',
            asset: 'Assets/Quiz/FR/avion.png',
            onTap: (String val) => _nextQuestion(val),
          ), // 10
          QCUWidget3(
            key: const ValueKey(5),
            questionId: 5,
            question: '5. Je choisis la bonne image:',
            desc: 'Il joue au ballon.',
            asset1: 'Assets/Quiz/FR/footBall.png',
            asset2: 'Assets/Quiz/FR/notFootBall.png',
            onTap: (String val) => _nextQuestion(val),
          ), // 11
          QCUWidget(
            key: const ValueKey(6),
            questionId: 6,
            question:
                '6. Je choisis l’étiquette convenable pour compléter la phrase:',
            question2: 'Sara écrit________',
            ansList: const ['au tableau.', 'au tablo.', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 12
          QCUWidget4(
            key: const ValueKey(7),
            questionId: 7,
            question: '7. Je mets les lettres en ordre pour trouver le mot:',
            letters: 'e – b – a – r – c – l – a – t',
            pronomIndefini: 'Un',
            onTap: (String val) => _nextQuestion(val),
          ), // 13
          QCUWidget4(
            key: const ValueKey(8),
            questionId: 8,
            question: '8. Je mets les syllabes en ordre:',
            letters: 're - cou - tu - ver',
            pronomIndefini: 'Une',
            onTap: (String val) => _nextQuestion(val),
          ), // 14
          QCUWidget4(
            key: const ValueKey(9),
            questionId: 9,
            question: '9. Je mets les mots en ordre pour trouver la phrase:',
            letters: 'va - Nadine - l’école - mère - avec - à - sa',
            pronomIndefini: '',
            onTap: (String val) => _nextQuestion(val),
          ), // 15
          QCUWidget5(
            key: const ValueKey(10),
            questionId: 10,
            question: '10.Je choisis la bonne réponse:',
            question2: 'L’enfant a vu ',
            asset: 'Assets/Quiz/FR/mer.png',
            ansList: const ['la mer. ', 'la mère.', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 16
        ]);
        break;
      case 'FR_DELF': // French Test (DELF)
        _testList.addAll([
          QCUWidget(
            key: const ValueKey(1),
            questionId: 1,
            question: '1.1 Je complète la phrase avec le mot qui me semble correct:',
            question2: 'Appelle-moi ____________________ tu aurais besoin d’aide.',
            ansList: const ['au cas où', 'dès que', 'quand', 'si'],
            onTap: (String val) => _nextQuestion(val),
          ), // 1
          QCUWidget(
            key: const ValueKey(2),
            questionId: 2,
            question: '1.2 Je complète la phrase avec le mot qui me semble correct:',
            question2: 'Désolée, je ne peux pas venir aujourd’hui car je dois ___________________ ma fille chez le médecin.',
            ansList: const ['amener', 'emporter', 'ramener', 'apporter'],
            onTap: (String val) => _nextQuestion(val),
          ), // 2
          QCUWidget(
            key: const ValueKey(3),
            questionId: 3,
            question: '1.3 Je complète la phrase avec le mot qui me semble correct:',
            question2: 'Après avoir payé l’addition, il est normal de laisser un ______________ au serveur.',
            ansList: const ['salaire', 'pourboire', 'profit', 'solide'],
            onTap: (String val) => _nextQuestion(val),
          ), // 3
          QCUWidget(
            key: const ValueKey(4),
            questionId: 4,
            question: '1.4 Je complète la phrase avec le mot qui me semble correct:',
            question2: 'Comment tu __________________ au travail le matin ?',
            ansList: const ['es', 'marches', 'vas', 'prends'],
            onTap: (String val) => _nextQuestion(val),
          ), // 4
          QCUWidget6(
            key: const ValueKey(5),
            questionId: 5,
            question: '5.Je choisis la bonne réponse:',
            question2: 'L’enfant a vu ',
            asset: 'Assets/Quiz/FR/mer.png',
            ansList: const ['la mer.', 'la mère.', 'Pas de réponse'],
            onTap: (String val) => _nextQuestion(val),
          ), // 5

        ]);
        break;
      case 'EN': // English Test
        _testList.addAll([
          QCUWidget(
            key: const ValueKey(1),
            questionId: 1,
            question: '1. I .......... that the situation is out of control.',
            ansList: const ['see', 'am seeing', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 1
          QCUWidget(
            key: const ValueKey(2),
            questionId: 2,
            question:
                '2. You haven\'t said a word all morning. What...........  about?',
            ansList: const [
              'do you think',
              'are you thinking',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 2
          QCUWidget(
            key: const ValueKey(3),
            questionId: 3,
            question: '3. Mary..........  very naughty these days.',
            ansList: const ['is', 'is being', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 3
          QCUWidget(
            key: const ValueKey(4),
            questionId: 4,
            question:
                '4. Our school usually breaks .......... for the summer in July.',
            ansList: const ['off', 'up', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 4
          QCUWidget(
            key: const ValueKey(5),
            questionId: 5,
            question:
                '5. The man managed to break ............... , of prison early this morning.',
            ansList: const ['off', 'out', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 5
          QCUWidget(
            key: const ValueKey(6),
            questionId: 6,
            question:
                '6. Abraham Lincoln was the first.......... president of the USA.',
            ansList: const ['republican', 'republic', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 6
          QCUWidget(
            key: const ValueKey(7),
            questionId: 7,
            question:
                '7. She has never been on TV before. It\'s the first time........ .',
            ansList: const [
              'she was on TV',
              'she is on TV',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 7
          QCUWidget(
            key: const ValueKey(8),
            questionId: 8,
            question: '8. "What .......... for a living?" "I work as a nurse."',
            ansList: const ['are you doing', 'you do', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 8
          QCUWidget(
            key: const ValueKey(9),
            questionId: 9,
            question: '9. By 2008, Katie ....... six countries in Europe.',
            ansList: const [
              'had already visited',
              'already visited',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 9
          QCUWidget(
            key: const ValueKey(10),
            questionId: 10,
            question:
                '10. They ....... for three hours before they found the house.',
            ansList: const [
              'have been walking',
              'has been walking',
              'were walking'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 10
          QCUWidget(
            key: const ValueKey(11),
            questionId: 11,
            question:
                '11. "Do you remember when we were children?" "Yes, Grandma .......... always make us strawberry muffins.',
            ansList: const ['would', 'was used to', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 11
          QCUWidget(
            key: const ValueKey(12),
            questionId: 12,
            question:
                '12. "Tom had trouble with the group project." "Yes. He ...... to working with others." ',
            ansList: const ['isn\'t didn\'t used', 'are', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 12
          QCUWidget(
            key: const ValueKey(13),
            questionId: 13,
            question:
                '13. Don\'t feel bad if your first job isn\'t anything exciting. Before they were famous, some of today\'s stars......... ordinary jobs, too!',
            ansList: const ['have had', 'had', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 13
          QCUWidget(
            key: const ValueKey(14),
            questionId: 14,
            question:
                '14. The Internet has brought ........... great changes in the way we get information. ',
            ansList: const ['up', 'about', 'in'],
            onTap: (String val) => _nextQuestion(val),
          ), // 14
          QCUWidget(
            key: const ValueKey(15),
            questionId: 15,
            question:
                '15. I find it very easy to .............................. people. There\'s hardly anyone I don\'t like.',
            ansList: const [
              'have a good time',
              'have the time of my life',
              'get along with'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 15
          QCUWidget(
            key: const ValueKey(16),
            questionId: 16,
            question:
                '16. Are you seeing Julie tonight? No, I will have already left ............. the time she gets here. ',
            ansList: const ['at', 'on', 'by'],
            onTap: (String val) => _nextQuestion(val),
          ), // 16
          QCUWidget(
            key: const ValueKey(17),
            questionId: 17,
            question: '17. The plane ............ off at 9 sharp.',
            ansList: const ['takes', 'will take', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 17
          QCUWidget(
            key: const ValueKey(18),
            questionId: 18,
            question:
                '18. Her family couldn\'t decide .......... the best place to go for their summer holidays.',
            ansList: const ['what', 'on', 'about'],
            onTap: (String val) => _nextQuestion(val),
          ), // 18
          QCUWidget(
            key: const ValueKey(19),
            questionId: 19,
            question: '19. The teachers don\'t allow ..........in class.',
            ansList: const ['to talk', 'talk', 'talking'],
            onTap: (String val) => _nextQuestion(val),
          ), // 19
          QCUWidget(
            key: const ValueKey(20),
            questionId: 20,
            question:
                '20. Why don\'t you try ...................... (put) some petrol in the. tank?',
            ansList: const ['to put', 'put', 'putting'],
            onTap: (String val) => _nextQuestion(val),
          ), // 20
          QCUWidget(
            key: const ValueKey(21),
            questionId: 21,
            question:
                '21. The teacher didn\'t believe Jarrod\'s excuse ........having been so late.',
            ansList: const ['on', 'at', 'for'],
            onTap: (String val) => _nextQuestion(val),
          ), // 21
          QCUWidget(
            key: const ValueKey(22),
            questionId: 22,
            question:
                '22. A new shopping center ..........outside the city center.',
            ansList: const ['is being built', 'built', 'to be built'],
            onTap: (String val) => _nextQuestion(val),
          ), // 22
          QCUWidget(
            key: const ValueKey(23),
            questionId: 23,
            question:
                '23. Where................Volkswagen cars ..............?',
            ansList: const [
              'are ........manufacture',
              'is............ manufactured',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 23
          QCUWidget(
            key: const ValueKey(24),
            questionId: 24,
            question: '24. She was very ......... by the story he told .',
            ansList: const ['amuse', 'amusing', 'amused'],
            onTap: (String val) => _nextQuestion(val),
          ), // 24
          QCUWidget(
            key: const ValueKey(25),
            questionId: 25,
            question:
                '25. If you go to San Francisco, you ............the Golden Gate Bridge.',
            ansList: const ['will see', 'would see', 'Non of the above'],
            onTap: (String val) => _nextQuestion(val),
          ), // 25
          QCUWidget(
            key: const ValueKey(26),
            questionId: 26,
            question:
                '26. It\'s snowing outside. I\'m cold. I wish...........a hat and some gloves.',
            ansList: const ['have worn', 'had worn', 'am wearing'],
            onTap: (String val) => _nextQuestion(val),
          ), // 26
          QCUWidget(
            key: const ValueKey(27),
            questionId: 27,
            question: '27. Rarely............... on time.',
            ansList: const ['he shows', 'does he show', 'shows he'],
            onTap: (String val) => _nextQuestion(val),
          ), // 27
          QCUWidget(
            key: const ValueKey(28),
            questionId: 28,
            question:
                '28. I\'ll give you my phone number........... you need some information.',
            ansList: const ['so that', 'in case', 'when'],
            onTap: (String val) => _nextQuestion(val),
          ), // 28
          QCUWidget(
            key: const ValueKey(29),
            questionId: 29,
            question:
                '29. "Good news Cancerians! ..................of the hard time you\'ve been going through lately, things are set to Improve.',
            ansList: const ['despite', 'inspite', 'although'],
            onTap: (String val) => _nextQuestion(val),
          ), // 29
          QCUWidget(
            key: const ValueKey(30),
            questionId: 30,
            question: '30. People............ might develop lung cancer.',
            ansList: const [
              'who smoke heavily',
              'who smoke heavily,',
              ',who smoke heavily,'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 30
          QCUWidget(
            key: const ValueKey(31),
            questionId: 31,
            question: '31. My sister ............ lives in America.',
            ansList: const [
              'who works as a scientist',
              'who works as a scientist,',
              ',who works as a scientist,'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 31
          QCUWidget(
            key: const ValueKey(32),
            questionId: 32,
            question:
                '32. He was completely ............ after running for over half an hour.',
            ansList: const ['broke out', 'worn out', 'lost out'],
            onTap: (String val) => _nextQuestion(val),
          ), // 32
          QCUWidget(
            key: const ValueKey(33),
            questionId: 33,
            question:
                '33. "Why did you choose to become a marine biologist?"she asked.',
            ansList: const [
              'She wanted to know Why did you choose to become a marine biologist.',
              'She wanted to know Why you chose to become a marine biologist?',
              'She wanted to know Why you had chosen to become a marine biologist.'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 33
          QCUWidget(
            key: const ValueKey(34),
            questionId: 34,
            question: '34. The professor said " Do not forget your projects."',
            ansList: const [
              'The professor told them Do not forget the projects.',
              'The professor told to not forget the projects.',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 34
          QCUWidget(
            key: const ValueKey(35),
            questionId: 35,
            question: '35. Paul.............at the garage Yesterday.',
            ansList: const [
              'fixed his car',
              'had his car fixed',
              'Non of the above'
            ],
            onTap: (String val) => _nextQuestion(val),
          ), // 35
        ]);
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
  List<Widget> _children = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadButtons();
    super.initState();
  }

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
            children: _children,
          ),
        ],
      ),
    );
  }

  _onTap(String val) {
    // Save Answer
    widget.onTap(val);
  }

  void _loadButtons() {
    for (var _element in widget.ansList) {
      _children.add(MyBtn3(
        btnText: _element,
        height: 70,
        width: 200,
        onPress: () => _onTap(_element),
        color1: Colors.red,
        color2: Colors.white,
      ));
      _children.add(const SizedBox(width: 10));
    }
    if (mounted) {
      setState(() {
        _children;
      });
    }
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

class QCUWidget6 extends StatefulWidget {
  double questionId;
  String question;
  String question2;
  String asset;
  List<String> ansList;
  Function(String value) onTap;

  QCUWidget6(
      {Key? key,
        required this.questionId,
        required this.question,
        required this.question2,
        required this.asset,
        required this.ansList,
        required this.onTap})
      : super(key: key);

  @override
  State<QCUWidget6> createState() => _QCUWidget6State();
}

class _QCUWidget6State extends State<QCUWidget6> {
  List<Widget> _children = [];

  @override
  void initState() {
    // TODO: implement initState
    _loadButtons();
    super.initState();
  }
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
              Text(
                widget.question2,
                style: const TextStyle(fontSize: 20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _children,
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

  void _loadButtons() {
    for (var _element in widget.ansList) {
      _children.add(MyBtn3(
        btnText: _element,
        height: 70,
        width: 200,
        onPress: () => _onTap(_element),
        color1: Colors.red,
        color2: Colors.white,
      ));
      _children.add(const SizedBox(width: 10));
    }
    if (mounted) {
      setState(() {
        _children;
      });
    }
  }
}