import 'dart:ui';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


import 'appColors.dart';
Text customText1(String text, color, double size,
    {indent = TextAlign.start, fontWeight = FontWeight.normal, maxLines = 2}) {
  return Text(
    text,
    textAlign: indent,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontFamily: 'gelion regular',
      fontWeight: fontWeight,
    ),
  );
}

SizedBox gapHeight(double space) => SizedBox(
  height: space,
);

SizedBox gapWeight(double space) => SizedBox(
  width: space,
);

Widget titledTextField(String title, String hint,
    TextEditingController controller, TextInputType inputType,
    {bool textFieldEnable = true,
      titlecolor = AppColors.defaultBlack,
      fillcolor = AppColors.riderGray2,
      space = 10,
      fontWeight = FontWeight.normal,
      promptMessage = 'Invalid Email',
      visible = false,
      isVisible = true,}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
                visible: isVisible,
                child: customText1(title, titlecolor, 14.sp,
                    fontWeight: fontWeight)),
            Visibility(
              visible: visible,
              child: customText1(promptMessage, AppColors.riderRed, 12.sp,
                  fontWeight: fontWeight),
            ),
          ],
        ),
        gapHeight(space),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10.r),
              border: Border.all(color: appBorderColor, width: 0.5.r,),
              color: fillcolor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 280.w,
                height: 40.h,
                child: GestureDetector(
                  child: Center(
                    child: TextField(
                      enabled: textFieldEnable,
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10.w, 0.h, 30.w, 0.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: hint,
                        hintStyle: TextStyle(
                          color: AppColors.defaultBlack,
                          fontSize: 12.sp,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.defaultBlack,
                        fontSize: 14.sp,
                        fontFamily: 'Lato',
                      ),
                      keyboardType: inputType,
                      cursorColor: AppColors.defaultBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

}

Future<Object?> showSnackBar(BuildContext context, String title, String content,
    {color = AppColors.riderLightGreen, icon = Icons.check_circle,
      iconColor= AppColors.riderGreen}) {
  return showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (_, c) {
      return SizedBox(
        height: 10.h,
        child: Flash.bar(
          borderWidth: 2.h,
          barrierDismissible: true,
          controller: c,
          backgroundColor: color,
          position: FlashPosition.bottom,
          margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r)),
          child: FlashBar(
            title: Row(children: [
              Icon(
                icon,
                color: iconColor,
              ),
              gapWeight(10.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  color: iconColor,
                ),
              ),
            ]),
            content: Text(
              content,
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'Lato',
                color: AppColors.defaultBlack,
              ),
            ),
          ),
          borderColor: color,
          brightness: Brightness.light,
        ),
      );
    },
  );
}