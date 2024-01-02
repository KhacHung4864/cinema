import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropDownButton extends StatefulWidget {
  final List<String?> items;
  final Function(String) onChanged;
  final String hintText;
  final String? icon;
  final String? selectedValue;

  const AppDropDownButton({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.icon,
    this.selectedValue,
  }) : super(key: key);

  @override
  AppDropDownButtonState createState() => AppDropDownButtonState();
}

class AppDropDownButtonState extends State<AppDropDownButton> {
  late String selectedValue;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue ?? "";
  }

  bool isSelect = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 67.w, maxHeight: 67.w),
      alignment: Alignment.center,
      width: 375.w,
      decoration: BoxDecoration(
        border: Border.all(
            color: isSelect == true ? AppTheme.green : AppTheme.pink,
            width: 1.5.w),
        borderRadius: BorderRadius.circular(30.w),
        color: const Color(0xffFFFFFF).withOpacity(0.06),
      ),
      padding: EdgeInsets.only(top: 2.w, right: 25.w, left: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 9,
            child: DropdownButtonFormField<String>(
              dropdownColor: AppTheme.blackBackground,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 10.w),
                label: RichText(
                  maxLines: 1,
                  text: TextSpan(
                    text: '',
                    style: AppFonts.poppins500(18.sp, AppTheme.white),
                    children: [
                      TextSpan(
                          text: widget.hintText,
                          style: AppFonts.poppins500(20.sp, AppTheme.white)),
                    ],
                  ),
                ),
                border: InputBorder.none,
              ),
              value: widget.items.contains(selectedValue)
                  ? selectedValue
                  : widget.items.first,
              icon: const Visibility(
                visible: false,
                child: Icon(Icons.arrow_downward),
              ),
              elevation: 16,
              isExpanded: true,
              style: AppFonts.poppins500(16.sp, AppTheme.white),
              onChanged: (String? newValue) {
                setState(() {
                  isSelect = false;
                  selectedValue = newValue!;
                  selectedIndex = widget.items.indexOf(newValue);
                });
                widget.onChanged(newValue!);
              },
              items: widget.items.map((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5.w, top: 5.w),
                    child: Text(
                      value!,
                      style: AppFonts.poppins500(17.sp, AppTheme.white),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 18.w,
              color: AppTheme.white,
            ),
          )
        ],
      ),
    );
  }
}
