import 'package:flutter/material.dart';

class EnterYourPassword extends StatefulWidget {
  EnterYourPassword({super.key, required this.formKey});
  var formKey;
  @override
  State<EnterYourPassword> createState() => _EnterYourPasswordState();
}

class _EnterYourPasswordState extends State<EnterYourPassword> {
  var passController = TextEditingController();
  var isObscure = true;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: passController,
          validator: (value) {
            if (passController.text.isEmpty) {
              return 'Format phone number';
            } else if (value!.length <= 5) {
              return 'Password should be greater than 5 digits';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {});
          },
          obscureText: isObscure,
          obscuringCharacter: '*',
          decoration: InputDecoration(
              errorText: error,
              suffixIcon: isObscure == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = false;
                        });
                      },
                      icon: const Icon(Icons.visibility))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = true;
                        });
                      },
                      icon: const Icon(Icons.visibility_off)),
              labelText: 'Enter your Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
