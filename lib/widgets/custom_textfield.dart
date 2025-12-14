import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
  });
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,

      style: const TextStyle(                                                                         //this gives us the desired white text...in the textfield
        color: Colors.white,
      ),

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white),
        ),
        //fillColor: Colors.white,                                                                           //can remove this
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        focusColor: Colors.white,
        
      ),
      cursorColor: Colors.white,
      
    );
  }
} 
