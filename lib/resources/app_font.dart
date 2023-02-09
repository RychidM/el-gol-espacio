import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/resources/app_colors.dart';

class LivescoreText extends StatelessWidget {
  final double fontSize;
  final Color color;
  final Color? backgroundColor;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final String text;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  const LivescoreText(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.color = AppColors.lWhite,
      this.backgroundColor,
      this.letterSpacing,
      this.wordSpacing,
      this.textStyle,
      this.textAlign, this.fontWeight, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro(
        fontSize: fontSize,
        color: color,
        backgroundColor: backgroundColor,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textStyle: textStyle,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
