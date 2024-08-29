
  import 'package:flutter/material.dart';

Widget customTextField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required TextInputType textInputType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        validator: (value){
          if(value!.isEmpty){
            return "this field is Required";
          }return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
