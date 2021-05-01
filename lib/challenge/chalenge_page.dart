import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();

}

class _ChallengePageState extends State<ChallengePage > {
  final _controller = ChallengeController();
  final pageController= PageController();

  @override
  void initState() {
    pageController.addListener(() {
      _controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  // Função que chama próxima página de questão, com uma animação
  // linear que dura 200 milisegundos.
  void nextPage(){
    if (_controller.currentPage < widget.questions.length) {
      pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  void onSelected(bool value){
    if (value){
      _controller.qtdAnswerRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: SafeArea(
          top: true, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              // Widget recebe um parâmetro para escutar e reconstrói na tela apenas aquilo que for indicado.
              // No caso está sendo reconstruído apenas o QuestionIndicatorWidget e não a tela toda como faria o setState.
              ValueListenableBuilder<int>(valueListenable: _controller.currentPageNotifier, builder: (context, value, _) =>
                QuestionIndicatorWidget(currentPage: value, lenght: widget.questions.length),
              ),
            ],
          )
        ),
      ),

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions.map((e) => QuizWidget(question: e, onSelected: onSelected)).toList(),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
        child: ValueListenableBuilder<int>(
          valueListenable: _controller.currentPageNotifier, builder: (context, value, _) =>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (value < widget.questions.length) 
                Expanded(child: NextButtonWidget.white(label: 'Próxima', onTap: nextPage)),
              if (value == widget.questions.length)
                Expanded(
                  child: NextButtonWidget.green(
                    label: 'Confirmar', 
                    onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => 
                        ResultPage(
                          title: widget.title, 
                          lenghListQuestions: widget.questions.length, 
                          result: _controller.qtdAnswerRight
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}