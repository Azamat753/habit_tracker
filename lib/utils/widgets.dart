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

AppBar buildAppBarWithBack(
    String text, Function() onBackPressed, String textName) {
  return AppBar(
    actions: [],
    leading: IconButton(
      iconSize: 21,
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: ColorRes.dark,
      ),
      splashRadius: 20,
      onPressed: onBackPressed,
    ),
    titleSpacing: -5,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 6.h,
        ),
        Expanded(
          child: Center(
            child: Text(
              text,
              style: TextStyleRegular(color: ColorRes.dark, fontSize: 16.0.sp),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Text(
            textName,
            style: TextStyleRegular(color: ColorRes.dark, fontSize: 16.0.sp),
          ),
        ),
      ],
    ),
  );
}

Widget buildHistoryText(String text) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
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
          style: TextStyleMedium(color: Colors.black, fontSize: 14.0.sp),
        ),
        const Icon(
          Icons.close,
          color: Colors.black,
        ),
      ],
    ),
  );
}

Widget emoji(
  String emoji,
  double size,
  double sizeText,
) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(20),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: size,
          child: SizedBox(
            child: CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 5.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
        Text(
          emoji, // Ваш текст
          style: TextStyleMedium(
            color: Colors.black,
            fontSize: sizeText.sp,
          ),
        ),
      ],
    ),
  );
}

Widget emojiDetail(
  String emoji,
  double size,
  double sizeText,
) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(20),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: size,
          child: SizedBox(
            height: 32.h,
            width: 34.w,
            child: CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 5.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
        Text(
          emoji, // Ваш текст
          style: TextStyleMedium(
            color: Colors.black,
            fontSize: sizeText.sp,
          ),
        ),
      ],
    ),
  );
}

Widget buildHabit(
  String title,
  String emojiT,
  String number,
) {
  return Container(
    margin: EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 2),
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
          emoji(emojiT, 2.5, 28),
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
              style: const TextStyleMedium(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buttonSettings(String text, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 9, right: 9, top: 6, bottom: 6),
      decoration: BoxDecoration(
        color: ColorRes.blue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 14, top: 8.dg, bottom: 10.dg),
      child: Text(
        text,
        style: TextStyleRegular(color: Colors.white, fontSize: 14.0.sp),
      ),
    ),
  );
}

Widget nameFollow(String text) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Shadow color
            offset: Offset(0, 2), // Offset of the shadow
            blurRadius: 4, // Blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Azamat",
          style: TextStyleMedium(fontSize: 14.sp, color: ColorRes.dark),
        ),
      ),
    ),
  );
}

Widget buttonDetail(String text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(left: 43, right: 43, top: 16, bottom: 16),
    decoration: BoxDecoration(
      color: ColorRes.blue,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 2),
        ),
      ],
    ),
    padding: EdgeInsets.only(top: 8.dg, bottom: 8.dg),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyleRegular(color: Colors.white, fontSize: 14.0.sp),
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
          style: TextStyleMedium(color: Colors.black, fontSize: 14.0.sp),
        ),
        Text(
          tRecord,
          style: TextStyleMedium(color: Colors.black, fontSize: 14.0.sp),
        ),
      ],
    ),
  );
}

Widget timerDetail() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Дни",
              style: TextStyleMedium(fontSize: 10.sp, color: ColorRes.dark),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Часы",
              style: TextStyleMedium(fontSize: 10.sp, color: ColorRes.dark),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Мин",
              style: TextStyleMedium(fontSize: 10.sp, color: ColorRes.dark),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Сек",
              style: TextStyleMedium(fontSize: 10.sp, color: ColorRes.dark),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "01:19:54:58",
              style: TextStyleMedium(color: ColorRes.dark, fontSize: 40.sp),
            )
          ],
        )
      ],
    ),
  );
}

Widget newHabit() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          "Новая привычка",
          style: TextStyleRegular(color: ColorRes.blue, fontSize: 14.sp),
        ),
      ),
    ),
  );
}

Widget habitMain(String emojiText, String textHabit, String textRecord,
    int textAttempt, int textDay, Function() onTap, Function() onLongPress) {
  return GestureDetector(
    onTap: onTap,
    onLongPress: onLongPress,
    child: Padding(
      padding: EdgeInsets.all(18),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  emoji(emojiText, 2.5, 28),
                  SizedBox(
                    width: 50.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(textHabit,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Попытки: ${textRecord}",
                              style: TextStyleRegular(
                                  fontSize: 14.sp, color: Colors.black)),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text("Рекорд: ${textAttempt}",
                              style: TextStyleRegular(
                                  fontSize: 14.sp, color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 8.h),
                width: double.infinity,
                height: 20.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: Colors.blue,
                ),
                child: Text(
                  "${textDay} / 7",
                  style: TextStyleMedium(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget editDialog(TextEditingController textFieldController) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 44, vertical: 26),
    child: Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: textFieldController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: ColorRes.blue),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: ColorRes.blue),
                borderRadius: BorderRadius.circular(16)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Название"),
      ),
    ),
  );
}

Widget circleButton(Function() onTap) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onTap,
        child: Icon(Icons.add, color: Colors.blue),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.white,
            elevation: 8),
      ),
    ),
  );
}

Widget editEmojiDialog(TextEditingController emojiController) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 108,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: emojiController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: ColorRes.blue),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: ColorRes.blue),
                borderRadius: BorderRadius.circular(16)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            hintText: "Иконка"),
      ),
    ),
  );
}

Widget buttonDialog(String text, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: ColorRes.blue,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 8.dg,
        bottom: 8.dg,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyleRegular(color: Colors.white, fontSize: 14.0.sp),
      ),
    ),
  );
}

Future<void> showMyDialog(BuildContext context, Function() deleteHabit) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(
            child: Text(
          'Удалить?',
          style: TextStyle(fontSize: 30),
        )),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Привычка будет удалена',
                  style: TextStyle(fontSize: 24),
                )),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonDefault('Нет', () {
                Navigator.of(context).pop();
              }, Colors.grey),
              buttonDefault('Да', deleteHabit, ColorRes.blue),
            ],
          ),
        ],
      );
    },
  );
}

Widget buttonDefault(String text, Function() onClick, Color buttonColor) {
  return Container(
    margin: const EdgeInsets.only(left: 13, right: 13, top: 16, bottom: 16),
    decoration: BoxDecoration(
      color: buttonColor,
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
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyleRegular(color: Colors.white, fontSize: 16.0.sp),
        )),
  );
}
