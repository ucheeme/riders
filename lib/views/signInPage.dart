import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:riders/viewmodels/signInController.dart';

import '../utility/appColors.dart';
import '../utility/app_ui_utils.dart';
import '../utility/passwordTextview.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: appWhite,
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.only(left: 35.h, right: 35.h),
            child: Column(
              children: [

                Row(
                  children: [
                    gapHeight(88.h),
                    GestureDetector(
                      onTap: () {
                        Get.back;
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.defaultBlack,
                        size: 20.w,
                      ),
                    ),
                    gapWeight(54.67.w),
                    customText1("Log In", AppColors.defaultBlack, 20.sp,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                gapHeight(54.h),
                titledTextField("Username", "Enter username",
                    controller.username, TextInputType.text, space: 9.h),
                gapHeight(22.h),
                ObscurePasswordTF(
                  title: 'Password',
                  controller: controller.password,
                  hint: 'Enter Password',
                  inputType: TextInputType.text,
                  visibility: controller.isVisible.value,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return Row(
                        children: [
                          Checkbox(value: controller.isChecked.value,
                              onChanged: (value) {
                                controller.isChecked.value = value!;
                              }),
                          customText1("Remember me", AppColors.defaultBlack, 10.sp,
                              fontWeight: FontWeight.w500)
                        ],
                      );
                    }),
                    customText1("Forgot Password?", AppColors.defaultBlack, 10.sp,
                        fontWeight: FontWeight.w500)
                  ],
                ),
                gapHeight(73.h),
                GestureDetector(
                  onTap: (){
                    Get.to(SignInPage(),
                        curve: Curves.easeInOut,
                        duration: Duration(seconds: 1));
                  },
                  child: Container(
                    width: 244.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: appBlue,
                        borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: Center(
                      child: customText1("Log in",Colors.white, 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
