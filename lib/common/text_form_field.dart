import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import "package:google_fonts/google_fonts.dart";

Widget textField({
  required TextEditingController textEditingController,
  required MultiValidator multiValidator,
  required Icon icon,
  required String label,
  required TextInputType textInputType,
}) {
  return TextFormField(
    validator: multiValidator.call,
    controller: textEditingController,
    keyboardType: textInputType,
    style: GoogleFonts.lato(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      label: Text(
        label,
        style: GoogleFonts.lato(
          color: Colors.grey,
        ),
      ),
      prefixIconColor: Colors.white,
      prefixIcon: icon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    cursorColor: Colors.white,
  );
}
