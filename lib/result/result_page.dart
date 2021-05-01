import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenghListQuestions;
  final int result;

  const ResultPage({Key? key, required this.title, required this.lenghListQuestions, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        width: double.maxFinite,
        child: ListView(
          children: [ 
            Column(        
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.trophy),
                SizedBox(height: 16.0),

                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(height: 16.0),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu ',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: '\n$title', style: AppTextStyles.bodyBold),
                      TextSpan(text: '\ncom $result acerto em $lenghListQuestions questões', style: AppTextStyles.body),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar', 
                          onTap: (){
                            Share.share('DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\n. Obtive: ' + 
                            ((result/lenghListQuestions)*100).toStringAsFixed(2) + 
                            '% de aproveitamento!');
                          }
                        ),
                      )),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68.0),
                        child: NextButtonWidget.white(
                          label: 'Voltar ao início', 
                          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}