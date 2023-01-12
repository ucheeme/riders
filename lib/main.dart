import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ots/ots.dart';
import 'package:provider/provider.dart';
import 'package:riders/utility/appColors.dart';
import 'package:get/get.dart'  as eos;
import 'package:riders/utility/app_ui_utils.dart';
import 'package:riders/utility/thememanager.dart';
import 'package:riders/views/signInPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));
    WidgetsFlutterBinding.ensureInitialized();
    return ScreenUtilInit(

      builder: (BuildContext context, Widget? child) {
        return OTS(
          child: eos.GetMaterialApp(
            initialRoute: '/',
            getPages: [eos.GetPage(name: '/', page: () => WelcomePage())],
            debugShowCheckedModeBanner: false,
            title: 'Rider',
            theme: ThemeData(
                primarySwatch: Colors.blue, canvasColor: Colors.transparent),
           themeMode: ThemeMode.light,
           // theme: ThemeData(
            //   primarySwatch: Colors.blue,
            // ),
          ),
        );
      }
      // child: MaterialApp(
      //   title: 'Flutter Demo',
      //   debugShowCheckedModeBanner: false,
      //   theme: ThemeData(
      //     primarySwatch: Colors.blue,
      //   ),
      //   home: const WelcomePage(),
      // ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         gapHeight(113.h),
         Image.asset("assets/images/logoPreview.png"),
         gapHeight(93.h),
         Expanded(
           child: Container(
             width: double.infinity,
             height: 313.h,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)
               )
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 gapHeight(53.5.h),
                 customText1("Welcome!",AppColors.defaultBlack, 28.sp,
                 fontWeight: FontWeight.w500),
                 gapHeight(40.5.h),
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
           ),
         )
        ],
      ),
    );
  }
}