import 'package:expenses_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//used to lock the screen orientation

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 85, 47, 173));
    var kDarkColorScheme=ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor:Color.fromARGB(255, 5, 64, 159), );
void main() {
  //used to keep app in fix mode
  
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ]
  // ).then((fn){
    //.then is being used after the device landscape is being set
    runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
      colorScheme: kDarkColorScheme,
      
          cardTheme: CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
            ),
          ),

      ),
      theme: ThemeData().copyWith(
        
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 16),
              )),
      //if we do directly ThemeData(useMaterial3:true)
      //then for whole app we have to confirgure the theme
      //themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );

  // });
  
}
