import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {

  // Variável que captura o nível de dificuldade do quiz escolhido
  final String label;
  LevelButtonWidget({
    Key? key,
    required this.label,
  }): assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label)), super(key: key);

  // Configuração de cor do botão de nível de dificuldade de acordo
  // com a label repassada do botão escolhido
  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'fontColor': AppColors.levelButtonTextFacil,
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'fontColor': AppColors.levelButtonTextMedio,
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'fontColor': AppColors.levelButtonTextDificil,
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'fontColor': AppColors.levelButtonTextPerito,
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Center(
          child: Text(
          label, 
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13.0
          ),
            ),
        ),
      ),
    );
  }
}