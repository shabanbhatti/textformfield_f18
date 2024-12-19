import 'package:flutter/material.dart';
import 'package:textformfield_/cnic.dart';
import 'package:textformfield_/email.dart';
import 'package:textformfield_/maleFemale.dart';
import 'package:textformfield_/number.dart';
import 'package:textformfield_/password.dart';
import 'package:textformfield_/textStyle.dart';
import 'package:textformfield_/yourName.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  var yourNameKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();
  
  var phoneKey = GlobalKey<FormState>();
  var cnicKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          toolbarHeight: 1,
          actions: const [],
        ),
        backgroundColor: const Color.fromARGB(255, 203, 203, 203),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 20,
              child: FittedBox(
                child: Text(
                  'Create Your Account',
                  style: myTextStyle(
                      size: 20, color: const Color.fromARGB(255, 111, 84, 1)),
                ),
              ),
            ),

            Flexible(
              flex: 50,
              child: EnterYourName(
                formKey: widget.yourNameKey,
              ),
            ),

            Flexible(
              flex: 50,
              child: EnterYourEmail(
                formKey: widget.emailKey,
              ),
            ),

            Flexible(
                flex: 50,
                child: EnterYourPhoneNumber(formKey: widget.phoneKey)),

            Flexible(flex: 50, child: EnterYourCNIC(formKey: widget.cnicKey)),

            Flexible(
                flex: 50, child: EnterYourPassword(formKey: widget.passKey)),

            const Flexible(flex: 10, child: MaleOrFemale()),

// ----------------------Bottom Button-------------------------------

            Flexible(
              flex: 20,
              child: FittedBox(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.amber)),
                      onPressed: () {
                        widget.yourNameKey.currentState!.validate();
                        widget.emailKey.currentState!.validate();
                        widget.phoneKey.currentState!.validate();
                        widget.cnicKey.currentState!.validate();
                        widget.passKey.currentState!.validate();
                      },
                      child: Text(
                        'Click here',
                        style: myTextStyle(size: 20, color: Colors.black),
                      )),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}


/** */