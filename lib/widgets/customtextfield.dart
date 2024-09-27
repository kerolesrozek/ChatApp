
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hint,this.onchanged
  });
  final String hint;
 final void Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.white)),
          contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          )),
    );
  }
}
