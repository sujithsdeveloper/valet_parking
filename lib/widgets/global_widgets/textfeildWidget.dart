import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallet_parking/controller/widgetController.dart';
import 'package:vallet_parking/utils/constants/color_constants.dart';

class TextfeildWidget extends StatelessWidget {
  const TextfeildWidget({
    super.key,
    required this.controller,
    required this.label,
    this.validation,
    this.wantObscure = false,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validation;
  final bool wantObscure;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final prowatch = context.watch<Widgetcontroller>();
    final proRead = context.read<Widgetcontroller>();
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      controller: controller,
      obscureText: wantObscure ? prowatch.textIsobscure : false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.primaryColor)),
        suffixIcon: wantObscure
            ? IconButton(
                onPressed: () {
                  proRead.isObscure();
                },
                icon: prowatch.textIsobscure
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ))
            : null,
        labelText: label,
        labelStyle: TextStyle(color: ColorConstants.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorConstants.primaryColor),
        ),
      ),
      validator: validation,
    );
  }
}
