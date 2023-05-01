import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../../Constant/Constant.dart';
import '../../Theme/Theme.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/R.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: screenHeight * 0.53,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: screenWidth * 0.15,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white,

                              child: Center(
                                child: Icon(
                                  Ionicons.notifications,
                                  size: 20,
                                ),
                              ),
                              padding: EdgeInsets.all(17),
                              minWidth: screenWidth * 0.004,
                              //use this class Circleborder() for circle shape.
                              shape: const CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.13),
                        height: screenHeight * 0.07,
                        width: screenWidth - 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.045,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Return"),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(50, 50)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(2, 22, 56, 1)),
                                        shadowColor: MaterialStateProperty.all(
                                            Color.fromRGBO(2, 22, 56, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: screenWidth * 0.3,
                                    height: screenHeight * 0.045,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text("One-way"),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(50, 50)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromRGBO(2, 22, 56, 1)),
                                        shadowColor: MaterialStateProperty.all(
                                            Color.fromRGBO(2, 22, 56, 1)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            width: screenHeight * 0.22,
                            child: Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    "        From ",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "    ADD",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "   Addisa Ababa",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("   Bole international ")
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: screenWidth * 0.09,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.white,

                          child: Column(
                            children: [
                              Icon(
                                Ionicons.airplane,
                                size: 15,
                              ),
                              Container(
                                child: Icon(
                                  Ionicons.airplane,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(7),

                          //use this class Circleborder() for circle shape.
                          shape: const CircleBorder(),
                        ),
                      ),
                      Container(
                          width: screenHeight * 0.17,
                          margin: EdgeInsets.only(bottom: screenHeight * 0.01),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 55),
                                  child: Text(
                                    "To",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )),
                              Text(" Select destination")
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.47,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                      child: Text(
                                    "Departue Date",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 0, left: screenHeight * 0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "25",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                        Text("  Apr \n Tuesday"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: 1,
                              color: Colors.black,
                            ),
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.07,
                              // margin: EdgeInsets.only(bottom: 40),
                              child: Column(
                                children: [
                                  Text("Return Date"),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: screenHeight * 0.02),
                                    child: Row(
                                      children: [
                                        Text(
                                          "10",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                        Text("   May \n Tuesday"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 0.5,
                          margin: EdgeInsets.only(top: 0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: screenHeight * 0.04),
                                      child: Text(
                                        "Cabin Class",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: screenHeight * 0.04),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Economy",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.1,
                              width: 1,
                              color: Colors.black,
                            ),
                            Container(
                              width: screenWidth * 0.4,
                              child: Column(
                                children: [
                                  Text(
                                    "Passengers",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: screenHeight * 0.04),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Ionicons.man,
                                            ),
                                            Text("1")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.man_2,
                                            ),
                                            Text("0")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.man_4),
                                            Text("0")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 0.5,
                          margin: EdgeInsets.only(top: 0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: screenWidth * 0.3,
                      margin: EdgeInsets.only(top: screenHeight * 0.05),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Search Flights"),
                        style: ThemeHelper().buttonStyle(),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
