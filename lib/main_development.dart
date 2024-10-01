import 'package:azkary_app/Azkary_app.dart';
import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_details_screen.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/screens/azkar_screen.dart';
import 'package:azkary_app/features/sabha/presentation/veiw/screens/sabha_screen.dart';
import 'package:azkary_app/features/settings/presentation/veiw/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
// await Future.wait([
//     LocalNotificationService.initialize(),
//     WorkManagerService.initialize(),
//   ]);
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
        return BlocProvider(
          create: (_) => ThemeCubit(), // Provide the ThemeCubit
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeState.themeData,
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
          ),
        );
      },
    );
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => const NavBarMainApp(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        AzkarScreen.routeName: (context) => const AzkarScreen(),
        SabhaScreen.routeName: (context) => const SabhaScreen(),
        AzkarDetailsScreen.routeName: (context) => const AzkarDetailsScreen(),
      };
}
