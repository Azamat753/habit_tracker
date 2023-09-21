import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_res.dart';
import '../resources/text_style.dart';

SvgPicture svgIcon(String iconName, {Color? color, double? size}) {
  return SvgPicture.asset(
    "lib/assets/images/$iconName.svg",
    color: color,
    width: size,
    height: size,
  );
}

Widget buildDivider({double indent = 0, double endIntend = 0}) {
  return Divider(
    color: ColorRes.lightGray,
    thickness: 1,
    indent: indent,
    endIndent: endIntend,
  );
}

Widget buildTextField(
    {String? hintText,
    double? height,
    Widget? icon,
    Color? backgroundColor,
    TextEditingController? controller,
    bool isInputWhiteSpace = true,
    maxLines = 1,
    Function(String)? onChanged,
    TextInputFormatter? inputFormat}) {
  return TextField(
    onChanged: onChanged,
    maxLines: maxLines,
    style: TextStyleRegular(fontSize: 16.sp, color: ColorRes.dark),
    decoration: InputDecoration(
      isDense: false,
      prefixIcon: icon,
      prefixIconColor: ColorRes.gray,
      contentPadding:
          EdgeInsets.symmetric(vertical: height ?? 10, horizontal: 20),
      hintText: hintText,
      hintStyle: TextStyleRegular(fontSize: 16.sp, color: ColorRes.gray),
      filled: true,
      fillColor: backgroundColor,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorRes.lightGray, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorRes.gray, width: 1)),
    ),
    controller: controller,
    inputFormatters: [
      if (!isInputWhiteSpace) FilteringTextInputFormatter.deny(RegExp(r'\s')),
      if (inputFormat != null) inputFormat
    ],
  );
}

Widget buildButton(
    {required BuildContext context, required String text, Function()? onTap}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 40.h,
    child: TextButton(
      style: TextButton.styleFrom(
          backgroundColor: ColorRes.lightBlue,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: ColorRes.gray,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyleBold(color: Colors.white, fontSize: 14.sp),
      ),
    ),
  );
}

AppBar buildAppBar(String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyleRegular(color: ColorRes.lightBlue, fontSize: 16.0),
    ),
  );
}

AppBar buildAppBarWithBack(String text, Function() onBackPressed) {
  return AppBar(
    leading: IconButton(
      iconSize: 21,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: ColorRes.lightBlue,
      ),
      splashRadius: 20,
      onPressed: onBackPressed,
    ),
    titleSpacing: -5,
    title: Text(
      text,
      style: TextStyleRegular(color: ColorRes.lightBlue, fontSize: 16.0),
    ),
  );
}

Widget buildTitleText({required String text}) {
  return Text(
    text,
    style: TextStyleBold(color: ColorRes.dark, fontSize: 24.sp),
  );
}
