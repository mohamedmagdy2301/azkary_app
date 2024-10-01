import 'package:azkary_app/Azkary_app.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/home/presentation/veiw/screens/home_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

// fake commit
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 758.666),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routes: routes,
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("ar", "AE"),
          ],
          locale: const Locale("ar", "AE"),
          initialRoute: '/',
        );
      },
    );
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => const NavBarMainApp(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        AzkarScreen.routeName: (context) => const AzkarScreen(),
        SabhaScreen.routeName: (context) => const SabhaScreen(),
        AzkarDetailsScreen.routeName: (context) => const AzkarDetailsScreen(),
      };
}
