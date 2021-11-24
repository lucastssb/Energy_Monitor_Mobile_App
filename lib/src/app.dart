import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home/home_screen.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData.from(
            colorScheme: const ColorScheme.light().copyWith(
                brightness: Brightness.light,
                primary: const Color.fromRGBO(255, 196, 120, 1),
                primaryVariant: const Color.fromRGBO(242, 208, 217, 1),
                secondary: const Color.fromRGBO(117, 207, 184, 1),
                secondaryVariant: const Color.fromRGBO(187, 223, 200, 1),
                background: const Color.fromRGBO(242, 228, 217, 1)),
            textTheme: GoogleFonts.nunitoTextTheme(
              TextTheme(
                headline4: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600, color: Colors.white),
                headline5: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600, color: Colors.white),
                headline6: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                bodyText1: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                bodyText2: GoogleFonts.nunito(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          darkTheme: ThemeData.from(
            colorScheme: const ColorScheme.dark().copyWith(
              brightness: Brightness.dark,
              primary: const Color.fromRGBO(0, 200, 220, 1),
              primaryVariant: const Color.fromRGBO(0, 220, 220, 0.6),
              secondary: const Color.fromRGBO(0, 0, 0, 1),
              secondaryVariant: const Color.fromRGBO(10, 10, 10, 1),
              background: const Color.fromRGBO(20, 20, 20, 1),
            ),
            textTheme: GoogleFonts.nunitoTextTheme(
              TextTheme(
                headline4: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600, color: Colors.white),
                headline5: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600, color: Colors.white),
                headline6: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                bodyText1: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                bodyText2: GoogleFonts.nunito(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case HomeScreen.routeName:
                    return const HomeScreen();
                  default:
                    return const HomeScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
