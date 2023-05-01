import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:login/Route/Routes.dart';
import 'package:login/View/userAuth/Login.dart';

import 'Bloc/bloc/email_password/auth_bloc.dart';
import 'Bloc/bloc/otp/otp_bloc.dart';
import 'View/userAuth/Otplogin.dart';
import 'View/userAuth/Registration.dart';
import 'View/Home/HomePage.dart';

final locator = GetIt.instance;
Future<void> main() async {
  locator.registerSingleton<AppBloc>(AppBloc());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(),
        ),
        BlocProvider<OTPAuthBloc>(
          create: (context) => OTPAuthBloc(firebaseAuth: FirebaseAuth.instance),
        ),
        // add additional bloc providers as needed
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.define(),
          theme: ThemeData.light(),
          home: LoginPage()),
    );
  }
}
