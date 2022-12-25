import 'package:flutter/material.dart';
import 'package:lootlo/utils/constants/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final String hint;
  final TextEditingController? controller;
  final TextInputAction action;
  final TextInputType type;
  final Color backgroundColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

  const CustomTextField({
    super.key,
    this.obscureText = false,
    this.hint = '',
    this.controller = null,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
    this.backgroundColor = Colors.white,
  });
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hint,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          obscureText: widget.obscureText,
          controller: widget.controller,
          textInputAction: widget.action,
          keyboardType: widget.type,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor,
            focusColor: widget.backgroundColor,
            hoverColor: widget.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hint,
            suffixIcon: widget.obscureText
                ? IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye))
                : null,
          ),
        ),
      ],
    );
  }
}
