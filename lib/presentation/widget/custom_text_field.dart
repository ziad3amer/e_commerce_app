import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.maxLine = 1,
    this.validator,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final int maxLine;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = false;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    final hidden = widget.obscureText && !_isVisible;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: hidden,
          maxLines: widget.obscureText ? 1 : widget.maxLine,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
              onPressed: () => setState(() => _isVisible = !_isVisible),
              icon: Icon(
                _isVisible ? Icons.visibility : Icons.visibility_off,
              ),
            )
                : widget.suffix,
            border: _border(Colors.grey),
            enabledBorder: _border(Colors.grey),
            focusedBorder: _border(const Color(0xFF171717)),
            errorBorder: _border(Colors.red),
            focusedErrorBorder: _border(Colors.red),
          ),
        ),
      ],
    );
  }
}