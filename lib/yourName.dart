import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterYourName extends StatefulWidget {
  EnterYourName({super.key, required this.formKey});
  var formKey;

  @override
  State<EnterYourName> createState() => _EnterYourNameState();
}

class _EnterYourNameState extends State<EnterYourName> {
  var nameController = TextEditingController();

  String? error;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
          ],
          controller: nameController,
          validator: (value) {
            if (nameController.text.isEmpty) {
              return 'Format name';
            } else if (value!.length <= 10) {
              return 'Name must contains at least 10 words';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
              suffixIcon: nameController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (nameController.text.isNotEmpty) {
                            nameController.clear();
                          }
                        });
                      },
                      icon: const Icon(Icons.close))
                  : null,
              // errorText: error,
              labelText: 'Enter your Name',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
