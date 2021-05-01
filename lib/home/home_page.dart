import 'package:devquiz/challenge/chalenge_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();
  
  @override
  void initState() {
      _controller.getUser();
      _controller.getQuizzes();

      // Escutador do controller que manda atualizar a tela quando há mudança no stateNotifier
      _controller.stateNotifier.addListener(() {
        setState(() {});
      });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int spaceButtonLevel = 9;
    if (_controller.state == HomeState.success){
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBarWidget(user: _controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              Container(
                child: Row(
                  children: [
                    Expanded(flex: spaceButtonLevel, child: LevelButtonWidget(label: 'Fácil')),
                    Spacer(flex: 1),
                    Expanded(flex: spaceButtonLevel, child: LevelButtonWidget(label: 'Médio')),
                    Spacer(flex: 1),
                    Expanded(flex: spaceButtonLevel, child: LevelButtonWidget(label: 'Difícil')),
                    Spacer(flex: 1),
                    Expanded(flex: spaceButtonLevel, child: LevelButtonWidget(label: 'Perito')),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: _controller.quizzes!.map((e) => 
                    QuizCardWidget(
                      title: e.title,
                      percent: e.questionAnswered/e.questions.length,
                      completed: '${e.questionAnswered}/${e.questions.length}',
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(questions: e.questions, title: e.title))),
                    ),
                  ).toList(),
                ),
              ),
              
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}