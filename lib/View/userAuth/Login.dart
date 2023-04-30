import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_text_line/horizontal_text_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/View/Bottom/Bottomnav.dart';
import 'package:login/View/Home/HomePage.dart';
import '../../Bloc/bloc/auth_bloc.dart';
import '../../Route/Routes.dart';
import '../../Theme/Theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppStateLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
          );
        }
      },
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppStateLoggedIn) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "2F",
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                " CAPTIAL",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: screenHeight * 0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " SIGN IN",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text(" Email")],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenWidth - 16,
                              height: screenHeight * 0.1,
                              child: TextFormField(
                                controller: _emailController,
                                decoration: ThemeHelper().textInputDecoration(
                                  '',
                                  ' ',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text(" Password")],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenWidth - 16,
                              height: screenHeight * 0.1,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: ThemeHelper().textInputDecoration(
                                  'password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 6) {
                                    return 'Password must be at least 6 characters long.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [Text(" Forget password ?")],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth - 16,
                              height: screenHeight * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AppBloc>().add(AppEventLogIn(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ThemeHelper().buttonStyle(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HorizontalTextLine(
                            text: "Continue With",
                            color: Colors.brown,
                            height: 1.5),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth - 16,
                              height: screenHeight * 0.07,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.Optlogin,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: screenWidth * 0.3),
                                        child: Icon(Icons.phone)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Center(
                                          child: const Text(
                                            "Phone number",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                style: ThemeHelper().buttonStyle(),
                              ),
                            ),
                          ],
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(" Don't Have An Account ? "),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.Register,
                                  );
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    )));
  }
}
