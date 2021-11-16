// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn_ui/extension/hexToColor.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final status = "Connect";
  late final vpnText = "Your current IP ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: HexColor.fromHex("#113250"),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: HexColor.fromHex("#2A547C"),
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: HexColor.fromHex("#113250"),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 3,
              right: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  Text(
                    status,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    vpnText,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
