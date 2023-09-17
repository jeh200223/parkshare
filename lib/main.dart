import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkshare/Screens/Settings/Components/header.dart';
import 'package:parkshare/WelcomeScreen/mainscreens.dart';

import 'network.dart';

void main() {
  sendDefaultData();
  runApp(const MyApp());
}

void sendDefaultData() async {
  final Insert networking = Insert();
  const int barrierControl = 0;
  const String manual = "manual";

  networking.insertData(manual, barrierControl.toString());
}

bool state = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: state ? const Mainscreen() : const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
// 나머지 텍스트 필드에 대해서도 동일하게 생성

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();
  FocusNode focusNode8 = FocusNode();
// 나머지 텍스트 필드에 대해서도 동일하게 생성

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const SizedBox(
                child: header(),
              ),
              const Divider(),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          const SizedBox(
                            width: 30,
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                height: 3,
                              ),
                            ),
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                          ),
                          wLicensesTextField(
                            context: context,
                            state: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 100,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              '인증',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class wLicensesTextField extends StatefulWidget {
  final bool? state;
  const wLicensesTextField({
    super.key,
    required BuildContext context,
    this.state = false,
  });

  @override
  State<wLicensesTextField> createState() => _wLicensesTextFieldState();
}

class _wLicensesTextFieldState extends State<wLicensesTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 30,
      child: TextField(
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (_) => setState(() {
          if (widget.state!) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).nextFocus();
          }
        }),
      ),
    );
  }
}
