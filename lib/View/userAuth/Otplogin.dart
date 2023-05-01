import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:login/View/Bottom/Bottomnav.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ionicons/ionicons.dart';

import '../../Theme/Theme.dart';

class OtpScreen extends StatefulWidget {
  String? City;
  OtpScreen({
    Key? key,
    this.City,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;

  String otpPin = " ";
  String countryDial = "+251";
  String verID = " ";

  int screenState = 0;

  Color blue = const Color(0xff8cccff);

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent!");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Timeout!");
      },
      forceResendingToken: null,

// set this to remove reCaptcha web
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .whenComplete(() async {
      var firebaseUser = await FirebaseAuth.instance.currentUser;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;
    print('yes');
    print('${widget.City}');

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                screenState == 0 ? stateRegister() : stateOTP(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (screenState == 0) {
                        if (usernameController.text.isEmpty) {
                          showSnackBarText("Username is still empty!");
                        } else if (phoneController.text.isEmpty) {
                          showSnackBarText("Phone number is still empty!");
                        } else {
                          verifyPhone(countryDial + phoneController.text);
                        }
                      } else {
                        if (otpPin.length >= 6) {
                          verifyOTP();
                        } else {
                          showSnackBarText("Enter OTP correctly!");
                        }
                      }
                    },
                    child: Container(
                      // height: 50,
                      width: screenWidth,
                      // margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 23),
                          ),
                          Spacer(),
                          MaterialButton(
                            onPressed: () async {},
                            color: Color.fromRGBO(25, 25, 56, 0.5),

                            child: Icon(
                              Ionicons.chevron_forward_sharp,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(15),

                            //use this class Circleborder() for circle shape.
                            shape: const CircleBorder(),
                          ),
                        ],
                      )),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromRGBO(2, 22, 56, 1);
                          }
                          // 98, 172, 181
                          return Color.fromRGBO(2, 22, 56, 1);
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget stateRegister() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.1),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
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
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 201, 40, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              width: screenWidth - 32,
              height: screenHeight * 0.40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 201, 40, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Container(
                      height: screenHeight * 0.3,
                      child: Image(
                          image: AssetImage(
                              'assets/images/mobile-phone-removebg-preview.png')),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
            const SizedBox(
              height: 8,
            ),
            IntlPhoneField(
              controller: phoneController,
              showCountryFlag: false,
              showDropdownIcon: false,
              initialValue: countryDial,
              onCountryChanged: (country) {
                setState(() {
                  countryDial = "+" + country.dialCode;
                });
              },
              decoration: ThemeHelper().textInputDecoration(),
            ),
          ],
        ),
      ),
    );
  }

  Widget stateOTP() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "We just sent a code to ",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: countryDial + phoneController.text,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: "\nEnter the code here and we can continue!",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                setState(() {
                  otpPin = value;
                });
              },
              pinTheme: PinTheme(
                activeColor: blue,
                selectedColor: blue,
                inactiveColor: Colors.black26,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Didn't receive the code? ",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screenState = 0;
                      });
                    },
                    child: Text(
                      "Resend",
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
