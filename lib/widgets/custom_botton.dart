  import 'package:flutter/material.dart';

Widget customButton({
    required String title,
    required VoidCallback press,
  }) {
    return MaterialButton(
      color: Colors.black,
      onPressed: press,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
