import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterYourCNIC extends StatefulWidget {
  EnterYourCNIC({super.key, required this.formKey});
  var formKey;
  @override
  State<EnterYourCNIC> createState() => _EnterYourCNICState();
}

class _EnterYourCNICState extends State<EnterYourCNIC> {
  var cnicController = TextEditingController();
  String? error;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cnicController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: cnicController,
          validator: (value) {
            if (cnicController.text.isEmpty) {
              return 'Format CNIC';
            } else if (value!.length <= 12 || value.length >= 14) {
              return 'Invalid CNIC';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {});
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              suffixIcon: cnicController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (cnicController.text.isNotEmpty) {
                            cnicController.clear();
                          }
                        });
                      },
                      icon: const Icon(Icons.close))
                  : null,
              errorText: error,
              labelText: 'Enter your CNIC',
              hintText: '_____-_______-_',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
