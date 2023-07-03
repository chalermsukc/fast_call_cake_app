// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fast_call_cake_app/views/cake_shop_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({super.key});

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroud image of body property
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_welcome.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'CAKE SHOP CALL FAST',
              style: GoogleFonts.kanit(
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 233, 2, 137),
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'สายด่วนชวนกินเค้ก',
              style: GoogleFonts.kanit(
                textStyle: TextStyle(
                  color: Color.fromARGB(255, 233, 2, 137),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Text(
                'Cake shops in Thailand that deliver delicious and gorgeously decorated birthday cakes for your special day.',
                style: GoogleFonts.kanit(
                  color: Color.fromARGB(255, 100, 100, 100),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CakeShopListUI(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.cakeCandles,
                color: Colors.white,
              ),
              label: Text(
                'Let\'s Go! สั่งกันเลย',
                style: GoogleFonts.kanit(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),              
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 233, 2, 137),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.width * 0.04,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    ));
  }
}
