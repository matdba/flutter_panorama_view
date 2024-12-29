import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_panorama_view/app_colors.dart';
import 'package:flutter_panorama_view/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(360.0, 800.0),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fab Lab',
            supportedLocales: const [Locale('fa', 'IR')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('fa', 'IR'),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            theme: lightTheme(),
            darkTheme: darkTheme(),
            home: const MainPage(),
          );
        },
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.backgroundColor,
        secondary: AppColors.grayColor.withOpacity(.3),
        tertiary: Color(0xffA3AED0).withOpacity(.3),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        elevation: 1,
        shadowColor: AppColors.grayColor.withOpacity(.2),
        foregroundColor: AppColors.primaryColor,
      ),
      cardTheme: const CardTheme(
        color: AppColors.whiteColor,
        elevation: 1,
        shadowColor: Colors.transparent,
        surfaceTintColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontFamily: 'Sans',
          color: AppColors.blackColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Sans',
          color: AppColors.blackColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      fontFamily: 'Sans',
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkTextColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkCardBackgroundColor,
        surfaceTintColor: AppColors.darkCardBackgroundColor,
        elevation: 1,
        shadowColor: AppColors.blackColor.withOpacity(.2),
        foregroundColor: AppColors.darkTextColor,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkBackgroundColor,
        secondary: AppColors.darkCardBackgroundColor,
        tertiary: AppColors.darkTabbarColor,
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          fontFamily: 'Sans',
          color: AppColors.darkTextColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Sans',
          color: AppColors.darkTextColor,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      cardTheme: const CardTheme(
        color: AppColors.darkCardBackgroundColor,
        surfaceTintColor: AppColors.darkCardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
      fontFamily: 'Sans',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.darkTextColor,
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColors.darkCardBackgroundColor,
          ),
          minimumSize: WidgetStateProperty.all(Size(200.r, 40.r)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(Size(200.r, 40.r)),
          foregroundColor: WidgetStateProperty.all<Color>(
            AppColors.primaryColor,
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
