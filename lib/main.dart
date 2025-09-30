import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// Color Scheme
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 95, 59, 112),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();  This is to ensure the app is binded
  // This set the state of the app to be on portrait mode only
  // It wraps even the runApp function
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  // fn,
  // ) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(66, 0, 0, 0),
            foregroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(246, 235, 194, 194),
          cardTheme: CardThemeData().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 5,
          ),
        ),
        home: const Expenses(),
      ),
    );
  // });
}
