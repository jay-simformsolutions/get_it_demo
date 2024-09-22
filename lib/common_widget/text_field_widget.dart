import 'package:flutter/material.dart';
import 'package:get_it_demo/values/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.autoValidateMode,
    required this.icon,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.isPasswordField = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;
  final IconData? icon;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool isPasswordField;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      autovalidateMode: widget.autoValidateMode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: (widget.isPasswordField)
            ? SizedBox(
                height: 24,
                width: 24,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: widget.isPasswordField
                      ? Padding(
                          padding: EdgeInsetsDirectional.zero,
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )
                      : null,
                ),
              )
            : null,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
