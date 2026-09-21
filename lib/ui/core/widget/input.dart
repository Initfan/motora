import 'package:flutter/material.dart';
import 'package:motora/utils/colors.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  final String? hintText;
  final String? initialValue;
  final String? suffixText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;

  const Input({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.hintText,
    this.initialValue,
    this.validator,
    this.suffixText,
    this.keyboardType = const TextInputType.numberWithOptions(),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixText: suffixText,
        hintText: hintText,
        fillColor: const Color(0xFFF8F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.gray300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.green, width: 1.5),
        ),
      ),
      validator:
          validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Inputan wajib diisi';
            }

            return null;
          },
    );
  }
}
