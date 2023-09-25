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

Widget buildHistoryText(String text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24, top: 24),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // Разместить элементы в конце
      children: [
        Text(
          text,
          style: const TextStyleMedium(color: Colors.black, fontSize: 14.0),
        ),
        const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ],
    ),
  );
}

Widget buildHabit(String title, String emoji, String number) {
  return Container(
    margin: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyleMedium(color: Colors.blue, fontSize: 14.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.all(22.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    emoji, // Ваш текст
                    style: TextStyleMedium(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  Transform.scale(
                    scale: 2.0, // Увеличьте это значение, чтобы увеличить размер прогресс бара
                    child: CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 5.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  )

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                number,
                style:
                    const TextStyleMedium(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
  );
}

Widget buildRecordText(String text, String tRecord) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // Разместить элементы в конце
      children: [
        Text(
          text,
          style: const TextStyleMedium(color: Colors.black, fontSize: 14.0),
        ),
        Text(
          tRecord,
          style: const TextStyleMedium(color: Colors.black, fontSize: 14.0),
        ),
      ],
    ),
  );
}
