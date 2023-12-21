import 'package:flutter/material.dart';
import 'package:registration/resources/color_manager.dart';
import 'package:registration/resources/text_style.dart';

import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';

class CostomTextFormField extends StatefulWidget {
  CostomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.prefixIcon,
      required this.obsecureType,
      required this.isObsecureText});

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  bool obsecureType;
  bool isObsecureText;
  @override
  State<CostomTextFormField> createState() => _CostomTextFormFieldState();
}

class _CostomTextFormFieldState extends State<CostomTextFormField> {
  // bool isObsecureText = true;

  void toggleObsecure() {
    widget.isObsecureText = !widget.isObsecureText;
    setState(() {});
  }

  String _errorMsg(String str) {
    switch (widget.hintText) {
      case "Enter Your Name":
        return "name is empty!";
      case AppStrings.emailHintText:
        return "Email is empty!";
      case AppStrings.password:
        return "password is empty!";
      default:
        return "field is empty";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyles.textStyleRegular16Grey,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        obscureText: widget.isObsecureText ?? false,
        decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            label: Text(
              widget.hintText,
              style: TextStyles.textStyleRegular14Grey,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.greyBorder),
            ),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: ColorManager.greyText,
            ),
            suffixIcon:  widget.obsecureType
                ? InkWell(
              onTap: () => toggleObsecure(),
              child:Icon(
                      widget.isObsecureText ? Icons.visibility_off : Icons.visibility,
                      color: ColorManager.greyText,
                    )
                   ,
            ):null),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMsg(widget.hintText);
          }
        });
  }
}
