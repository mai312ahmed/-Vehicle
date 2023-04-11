import 'package:car_store/cubits/registraition_cubit/registraition_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utilis/app_routers.dart';
import 'core/utilis/constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox("Vehicle");  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData light = ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      scaffoldBackgroundColor: kprimaryBackgroundColor,
      primarySwatch: Colors.purple,
      brightness: Brightness.light,
    );

    ThemeData dark = ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black87);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegistraitionCubit()),
        ],
        child: MaterialApp.router(
            routerConfig: AppRouters.router,
            debugShowCheckedModeBanner: false,
            color: kprimaryColor,
            // title:
            theme: darkMode ? dark : light));
  }
}

// theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kprimaryColor,textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
