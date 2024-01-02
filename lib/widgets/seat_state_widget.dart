import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class SeatStateWidget extends StatelessWidget {
  const SeatStateWidget({Key? key, this.color, required this.text, this.image}) : super(key: key);
  final Color? color;
  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    image!,
                    fit: BoxFit.fill,
                    width: 18,
                    height: 18,
                  ),
                )
              : Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: AppFonts.poppins500(15, Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
