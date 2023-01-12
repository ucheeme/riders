import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appColors.dart';
import 'app_ui_utils.dart';

class ObscurePasswordTF extends StatefulWidget {
  final String title, hint;
  final controller, inputType;
  final bool visibility;


  const ObscurePasswordTF(
      {Key? key,
        required this.controller,
        required this.inputType,
        required this.title,
        required this.hint,
        required this.visibility
      })
      : super(key: key);

  @override
  State<ObscurePasswordTF> createState() => _ObscurePasswordTFState();
}

class _ObscurePasswordTFState extends State<ObscurePasswordTF> {
  bool obscurePassword = true;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText1(widget.title, AppColors.defaultBlack, 12.sp),
            Visibility(
                visible:widget.visibility,
                child: customText1('wrong password', AppColors.riderRed, 12.sp)),
          ],
        ),
        gapHeight(9.h),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10.r),
              border: Border.all(color: appBorderColor, width: 0.5.r,),
              color: appBorderColor
          ),
          alignment: Alignment.centerLeft,
          child: TextField(
            onChanged: (value){

            },
            controller: widget.controller,
            obscureText: obscurePassword,
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.fromLTRB(10.w, 0, 30.w, 25.h),

              disabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    width: 0,
                    style: BorderStyle.none
                ),

              ) ,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                  width: 1.r,
                  color: AppColors.defaultBlack,
                ),

              ),
              //           disabledBorder:  OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.r),
              //           borderSide:  BorderSide(
              //           width: 0,
              //           color: AppColors.defaultBlack,
              //           style: BorderStyle.none
              //           ),
              //
              //           ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(
                    width: 0,
                    style: BorderStyle.none
                ),

              ),
              suffixIconColor: AppColors.defaultBlack,
              suffixIcon: IconButton(
                iconSize: 12.h,
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: obscurePassword?AppColors.defaultBlack : Colors.grey,
                ),
              ),
              filled: true,
              fillColor: AppColors.riderGray2,
              hintText: widget.hint,
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
              fontWeight: FontWeight.normal,
            ),
            keyboardType: widget.inputType,
            cursorColor: AppColors.riderGray2,
          ),
        ),
      ],
    );
  }

// double? spacer(){
//   if( widget.space != null){
//     return space;
//   } else{
//     return widget.space;
//   }
// }
}
