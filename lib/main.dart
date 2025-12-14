import 'package:flutter/material.dart';
import 'package:w_phonics/env/env.dart';                       
import 'package:w_phonics/pages/onboarding_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';        

void main() async{                                                      
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabasePubKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'W Phonics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        primaryColor: Colors.amberAccent.shade400,
        scaffoldBackgroundColor: Colors.grey.shade200,
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
            fixedSize: Size.fromHeight(50),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}
