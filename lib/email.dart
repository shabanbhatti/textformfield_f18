import 'package:flutter/material.dart';

class EnterYourEmail extends StatefulWidget {
  EnterYourEmail({super.key, required this.formKey});
  var formKey;

  @override
  State<EnterYourEmail> createState() => _EnterYourEmailState();
}

class _EnterYourEmailState extends State<EnterYourEmail> {
  var emailController = TextEditingController();

  String? error;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          onChanged: (value) {
            setState(() {});
          },
          controller: emailController,
          validator: (value) {
            var emailValidContext =
                r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
            var emailContext = RegExp(emailValidContext);
            if (emailController.text.isEmpty) {
              return 'Format Email';
            } else if (!emailContext.hasMatch(emailController.text)) {
              return 'Wrong input';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              suffixIcon: emailController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (emailController.text.isNotEmpty) {
                            emailController.clear();
                          }
                        });
                      },
                      icon: const Icon(Icons.close))
                  : null,
              errorText: error,
              labelText: 'Enter your email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
