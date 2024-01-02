import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class PriceDetail extends StatelessWidget {
  const PriceDetail({Key? key, required this.textOne, required this.price, this.moneySign = false, this.isBoldText = false}) : super(key: key);
  final String textOne;
  final bool moneySign;
  final String price;
  final bool? isBoldText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(textOne, style: isBoldText == true ? AppFonts.poppins600(16, Colors.white) : AppFonts.poppins500(15, const Color(0xFFFFFFA6))),
        const Spacer(),
        Row(
          children: [
            Text(price, style: isBoldText == true ? AppFonts.poppins600(16, Colors.white) : AppFonts.poppins500(15, const Color(0xFFFFFFA6))),
            Text(' VND', style: isBoldText == true ? AppFonts.poppins600(16, Colors.white) : AppFonts.poppins500(15, const Color(0xFFFFFFA6))),
          ],
        )
      ],
    );
  }
}
