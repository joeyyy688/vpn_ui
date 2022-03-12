// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn_ui/extension/hexToColor.dart';
import 'package:vpn_ui/pages/timeDigit.dart';

enum FlutterVpnState {
  connected,
  disconnected,
  connecting,
  disconnecting,
  genericError
}

String connectionState({required FlutterVpnState state}) {
  switch (state) {
    case FlutterVpnState.connected:
      return 'You are connected';
    case FlutterVpnState.connecting:
      return 'VPN is connecting';
    case FlutterVpnState.disconnected:
      return 'You are disconnected';
    case FlutterVpnState.disconnecting:
      return 'VPN is disconnecting';
    case FlutterVpnState.genericError:
      return 'Error getting status';
    default:
      return 'Getting connection status';
  }
}

String connectionButtonState({required FlutterVpnState state}) {
  switch (state) {
    case FlutterVpnState.connected:
      return 'Connected';
    case FlutterVpnState.connecting:
      return 'Connecting';
    case FlutterVpnState.disconnected:
      return 'Disconnected';
    case FlutterVpnState.disconnecting:
      return 'Disconnecting';
    case FlutterVpnState.genericError:
      return 'Error';
    default:
      return 'Disconnected';
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _elapsedTime = Duration.zero;
  late final status = "Connect";
  late final vpnText = "Your current IP ";
  late var _flutterVpnState = FlutterVpnState.disconnected;
  late bool switchValue = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      setState(() {
        _elapsedTime = elapsed;
      });
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hundreds = (_elapsedTime.inMilliseconds / 10) % 100;
    final seconds = _elapsedTime.inSeconds % 60;
    final minutes = _elapsedTime.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    const digitWidth = 20.0;
    return Scaffold(
      backgroundColor: HexColor.fromHex("#113250"),
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
      body: Column(
        children: [
          // Container(
          //   color: HexColor.fromHex("#113250"),
          // ),
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 520),
                child: Text(
                  connectionButtonState(state: _flutterVpnState),
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                vpnText,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 17),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  left: 50,
                ),
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage(
                          'assets/images/toppng.com-flag-graphics-of-italy-peru-flag-icon-1071x1070.png'),
                    ),
                  ),
                  title: Text(
                    '293.763.108.312',
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_flutterVpnState == FlutterVpnState.disconnected) {
                    setState(() {
                      _flutterVpnState = FlutterVpnState.connected;
                    });
                    _ticker.start();
                  }
                },
                child: Center(
                  child: AnimatedContainer(
                    margin: const EdgeInsets.only(top: 40),
                    height: 250,
                    width: 250,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor.fromHex('#53D29A'),
                            width: _flutterVpnState == FlutterVpnState.connected
                                ? 17
                                : 3),
                        borderRadius: BorderRadius.circular(140)),
                    child: _flutterVpnState == FlutterVpnState.connected
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              //color: HexColor.fromHex("#2A547C"),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "DURATION",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade600),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TimeDigit(minutesStr.substring(0, 1),
                                          width: digitWidth),
                                      TimeDigit(minutesStr.substring(1, 2),
                                          width: digitWidth),
                                      const TimeDigit(':', width: 6),
                                      TimeDigit(secondsStr.substring(0, 1),
                                          width: digitWidth),
                                      TimeDigit(secondsStr.substring(1, 2),
                                          width: digitWidth),
                                      const TimeDigit(':', width: 6),
                                      TimeDigit(hundredsStr.substring(0, 1),
                                          width: digitWidth),
                                      TimeDigit(hundredsStr.substring(1, 2),
                                          width: digitWidth),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  indent: 30,
                                  endIndent: 30,
                                  thickness: 3,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: IconButton(
                                    onPressed: () {
                                      if (_flutterVpnState ==
                                          FlutterVpnState.connected) {
                                        setState(() {
                                          _flutterVpnState =
                                              FlutterVpnState.disconnected;
                                        });
                                      }
                                      _ticker.stop();
                                    },
                                    icon: const Icon(
                                      Icons.power_settings_new_rounded,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // Text(
                                //   connectionButtonState(
                                //       state: _flutterVpnState),
                                // )
                              ],
                            ),
                          )
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: Icon(
                              Icons.power_settings_new_rounded,
                              color: HexColor.fromHex('#53D29A'),
                              size: 80,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                padding: const EdgeInsets.symmetric(vertical: 7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  color: HexColor.fromHex('#0e2840'),
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: AssetImage(
                            'assets/images/toppng.com-flag-graphics-of-italy-peru-flag-icon-1071x1070.png'),
                        height: 30,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 9),
                      child: const Text(
                        'Italy - Rome',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.39,
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        size: 14, color: Colors.grey)
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Authomatically Select Server",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Switch.adaptive(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
