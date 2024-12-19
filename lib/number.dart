import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterYourPhoneNumber extends StatefulWidget {
  EnterYourPhoneNumber({super.key, required this.formKey});
  var formKey;
  @override
  State<EnterYourPhoneNumber> createState() => _EnterYourPhoneNumberState();
}

class _EnterYourPhoneNumberState extends State<EnterYourPhoneNumber> {
  var phoneController = TextEditingController();

  String? error;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: phoneController,
          validator: (value) {
            if (phoneController.text.isEmpty) {
              return 'Format phone number';
            } else if (value!.length <= 10 || value.length >= 12) {
              return 'Number must contains 11 digits';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {});
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              suffixIcon: phoneController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (phoneController.text.isNotEmpty) {
                            phoneController.clear();
                          }
                        });
                      },
                      icon: const Icon(Icons.close))
                  : null,
              errorText: error,
              labelText: 'Enter your phone No',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
