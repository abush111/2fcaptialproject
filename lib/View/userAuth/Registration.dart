import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_text_line/horizontal_text_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:login/View/Bottom/Bottomnav.dart';
import 'package:login/View/Home/HomePage.dart';

import '../../Bloc/bloc/email_password/auth_bloc.dart';
import '../../Route/Routes.dart';
import '../../Theme/Theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final loginBloc = BlocProvider.of<AppBloc>(context);

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
                        margin: EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.white,

                                child: Icon(
                                  Ionicons.chevron_back_sharp,
                                  size: 30,
                                ),
                                padding: EdgeInsets.all(17),
                                minWidth: screenWidth * 0.004,
                                //use this class Circleborder() for circle shape.
                                shape: const CircleBorder(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.1),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, bottom: 12, right: 7, left: 4.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                " Register",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Full name",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenWidth - 16,
                              height: screenHeight * 0.1,
                              child: TextFormField(
                                controller: _nameController,
                                decoration: ThemeHelper().textInputDecoration(
                                  '',
                                  ' ',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter  name.';
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
                          children: [
                            Text(
                              " Email",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                          children: [
                            Text(
                              " Password",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ],
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
                          children: [
                            Text(
                              " Forget password ?",
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                                    loginBloc.add(AppEventRegister(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                                  }
                                },
                                child: const Text(
                                  "Register",
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
                          height: 5,
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              " Already Have An Account ? ",
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.Login,
                                  );
                                },
                                child: Text(
                                  "SIGN",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
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
