import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
final double percent;

  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0),
          child: Row(
            children: [
              Expanded(flex: 1, child: ChartWidget(percent: percent)),

              Expanded(
                flex: 2,
                child: Padding(
                padding: const EdgeInsets.only(left: 21.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vamos começar', style: AppTextStyles.heading),
                      Text('Comece o desafio e avance em conhecimento!', style: AppTextStyles.body),
                    ],
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