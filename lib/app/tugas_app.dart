
import 'package:flutter/material.dart';

import '../screens/task_list_screen.dart';

class TugasApp extends StatelessWidget {
  const TugasApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color pinkSoft = Color(0xFFF8C4D0);     
    const Color pinkAccent = Color(0xFFF4A6B8);    
    const Color whiteBg = Colors.white;           
    const Color pinkCardBorder = Color(0xFFFAD9E1); 
    const Color blackText = Color(0xFF222222);      

    return MaterialApp(
      title: 'Tugas Praktikum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: pinkSoft,
          primary: pinkAccent,
          secondary: pinkSoft,
          surface: whiteBg,
        ),
        scaffoldBackgroundColor: whiteBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: whiteBg,
          foregroundColor: blackText, 
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: blackText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: pinkCardBorder),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: pinkCardBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: pinkCardBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: pinkAccent, width: 1.5),
          ),
        ),
        // ===== TOMBOL PINK SOFT =====
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pinkAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: pinkAccent,
            side: const BorderSide(color: pinkAccent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: pinkAccent,
          foregroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: pinkAccent,
          ),
        ),
      ),
      home: const TaskListScreen(),
    );
  }
}