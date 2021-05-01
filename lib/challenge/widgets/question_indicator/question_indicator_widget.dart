import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;

  const QuestionIndicatorWidget({Key? key, required this.currentPage, required this.lenght}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.grey), 
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 7.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Questão $currentPage', style: AppTextStyles.body),
                    Text('de $lenght', style: AppTextStyles.body),
                  ],
                ),
                SizedBox(height: 15.0),
                ProgressIndicatorWidget(value: currentPage/lenght),
              ],
            ),
          ),
        ),
      ],
    );
  }
}