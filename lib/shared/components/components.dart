import 'package:flutter/material.dart';

import '../constants/color_manager.dart';

Widget defaultMaterialButton({
  required String text,
  bool haveBorder = false,
  bool isGoogle = false,
  Color borderColor = Colors.transparent,
  Color containerColor = ColorsManager.amber,
  Color textColor = ColorsManager.black,
  required Function()? valid,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
      ),
      child: Container(
        width: 374,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: containerColor,
          border: haveBorder
              ? Border.all(
                  color: borderColor,
                  width: 2.0,
                )
              : null,
        ),
        child: MaterialButton(
          onPressed: valid,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  required IconData prefix,
  required String label,
  required String? Function(String? value) validate,
  required TextEditingController controller,
  IconData? sufIcon,
  TextInputType? keyboard,
  bool isObscure = false,
  AutovalidateMode? autoValidateMode,

  void Function()? obscure,
}) {
  var normalBorder =  OutlineInputBorder(
      borderRadius:  BorderRadius.circular(15.0),
      borderSide: const BorderSide(  color: ColorsManager.brown, width: 2));
  return  Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 25.0,
    end: 25.0,
  ),
  child: TextFormField(
    autovalidateMode:autoValidateMode ,
    controller: controller,
    validator: validate,
    obscureText: isObscure,
    keyboardType: keyboard,
    decoration: InputDecoration(
      enabled: true,
      enabledBorder: normalBorder,
      errorBorder: normalBorder.copyWith(
        borderSide: const BorderSide(  color: ColorsManager.errorBorder, width: 3),
      ),
      disabledBorder: normalBorder.copyWith(
        borderSide: const BorderSide(color: ColorsManager.disableBorder, width: 3),
      ),
      focusedBorder: normalBorder.copyWith(
        borderSide: const BorderSide(color: ColorsManager.focusBorder, width: 3),
      ),
      focusedErrorBorder: normalBorder.copyWith(
          borderSide: const BorderSide(  color: ColorsManager.errorBorder, width: 3),),
      labelText: label,
      prefixIcon: Icon(
        prefix,
      ),
      suffixIcon: sufIcon != null ? IconButton(onPressed: obscure, icon: Icon(sufIcon,)) : null,
    ),
  ),
);
}

