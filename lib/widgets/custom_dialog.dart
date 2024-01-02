import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showMyDialog(BuildContext context,
    {required final String title,
    required final String content,
    final String? titleImage,
    final Function? onPressButtonOne,
    required final bool noButton,
    final Function? onPressButtonTwo,
    final String? logoTitle,
    final String? buttonOneText,
    final String? buttonTwoText}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.only(left: 27.w, right: 27.w),
          contentPadding: EdgeInsets.only(left: 20.w, right: 20.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: noButton
              ? SizedBox(
                  height: titleImage != null
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      titleImage != null
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: AspectRatio(
                                  aspectRatio: 0.9 / 0.4,
                                  child: Image.asset(titleImage)))
                          : const SizedBox.shrink(),
                      Container(
                        margin: EdgeInsets.only(bottom: 15.w),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppFonts.poppins600(20.sp, Colors.black)
                              .copyWith(height: 30 / 20),
                        ),
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.center,
                        style: AppFonts.poppins500(16.sp, Colors.black),
                      )
                    ],
                  ),
                )
              : FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.w),
                            topLeft: Radius.circular(20.w))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            logoTitle != null
                                ? SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: Image.asset(
                                      logoTitle,
                                      color: Colors.black,
                                    ))
                                : const SizedBox.shrink(),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: AppFonts.poppins700(22.sp, Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.w,
                        ),
                        Container(
                          height: 1.w,
                          color: const Color(0xFFA00D6A),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: AppFonts.poppins500(16.sp, Colors.black)
                              .copyWith(height: 24 / 16),
                        ),
                        SizedBox(
                          height: 30.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonOneText != null
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        onPressButtonOne!();
                                      },
                                      child:
                                          AppButton(titleButton: buttonOneText),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(
                              width: 20.w,
                            ),
                            buttonTwoText != null
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        onPressButtonTwo!();
                                      },
                                      child:
                                          AppButton(titleButton: buttonTwoText),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        );
      });
}
