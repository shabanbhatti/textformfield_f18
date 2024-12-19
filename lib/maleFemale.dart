import 'package:flutter/material.dart';

class MaleOrFemale extends StatefulWidget {
  const MaleOrFemale({super.key});

  @override
  State<MaleOrFemale> createState() => _MaleOrFemaleState();
}

class _MaleOrFemaleState extends State<MaleOrFemale> {
  bool isMale = false;
  var isFemale = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 50,
          
          child: Checkbox(
            value: isMale,
            onChanged: (value) {
              setState(() {
                if (isFemale == false) {
                  isMale = value!;
                } else if (isFemale == true) {
                  isFemale = false;
                  isMale = value!;
                }
              });
            },
          ),
        ),
        const Text('Male'),
        Flexible(
          flex: 50,
          child: Checkbox(
            value: isFemale,
            onChanged: (value) {
              setState(() {
                if (isMale == false) {
                  isFemale = value!;
                } else if (isMale == true) {
                  isMale = false;
                  isFemale = value!;
                }
              });
            },
          ),
        ),
        const Text('Female')
      ],
    );
  }
}
