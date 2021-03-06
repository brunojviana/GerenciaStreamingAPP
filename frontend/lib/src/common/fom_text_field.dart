import 'package:flutter/material.dart';
import 'package:frontend/src/theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension CoreFormTextField on Widget {
  Widget createFormField({
    required ThemeData theme,
    TextInputType keyboardType = TextInputType.name,
    TextInputAction textInputAction = TextInputAction.done,
    Color borderColor = AppColors.accent,
    double borderWidth = 1,
    bool obscureText = false,
    bool enabled = true,
    String? hint,
    FormFieldValidator? validator,
    String? mask,
    String? errorText,
    Map<String, RegExp>? maskFilter,
    ValueChanged<String>? onChange,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
  }) {

    final maskFormatter = MaskTextInputFormatter(
      mask: mask,
      filter: maskFilter,
      type: MaskAutoCompletionType.lazy,
    );

    final border = OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextFormField(
            inputFormatters: [maskFormatter],
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textAlignVertical: TextAlignVertical.center,
            obscureText: obscureText,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              constraints: const BoxConstraints(maxHeight: 40),
              isDense: true,
              hintText: hint,
              hintStyle: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textLight,
              ),
              errorText: errorText,
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
            ),
            validator: validator,
            onChanged: onChange,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            style: const TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textLight,
            ),
          )
        ],
      ),
    );
  }
}