import 'package:depertment_of_labor_employers/features/auth/presentation/pages/login.dart';
import 'package:depertment_of_labor_employers/core/presentation/pages/rootpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/config/env/environment.dart';
import 'features/addemployee/presentation/pages/rootemployee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('kh'),
      Locale('la'),
      Locale('mm'),
      Locale('th')
    ],
    path: 'assets/languages',
    child: ProviderScope(child: MyApp()),
    fallbackLocale: Locale('en'),
    startLocale: Locale('en'),
    saveLocale: false,
    useOnlyLangCode: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          title: 'Department of Labor Employers',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromARGB(255, 255, 255, 255)),
            useMaterial3: true,
          ),
          initialRoute: '/login',
          routes: <String, WidgetBuilder>{
            '/login': (BuildContext context) => LoginPage(),
            '/': (BuildContext context) => RootPage(),
            '/notifytowork': (BuildContext context) => NotificationsPages(),
          },
        );
      },
    );
  }
}
