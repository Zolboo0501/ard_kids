import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorMessage;
  final bool? filled;
  final Color? fillColor;
  final String? label;
  final bool? isPhone;
  final bool? enabled;
  final bool? error;
  final double? height;
  final FormFieldValidator<String>? validator;
  final bool? isPassword;
  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorMessage,
    this.filled = true,
    this.label,
    this.fillColor = Colors.white,
    this.isPhone,
    this.enabled,
    this.error,
    this.validator,
    this.height,
    this.isPassword,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword == true ? !_isPasswordVisible : false,
      keyboardType: widget.isPhone == true
          ? TextInputType.number
          : TextInputType.text,
      maxLength: widget.isPhone == true ? 8 : null,
      inputFormatters: widget.isPhone == true
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      style: TextStyle(
        color: Colors.black, // 👈 Text color when user types
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w500,
        ),
        hintText: widget.hintText,
        filled: widget.filled,
        fillColor: widget.enabled == false
            ? Colors.grey[200]
            : widget.fillColor,
        errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface, // Border color when not focused
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface, // Border color when focused
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
        ),
        errorText: widget.error == true ? '' : null,
        counterText: widget.isPhone == true ? "" : null,
        suffixIcon: widget.isPassword == true
            ? _isPasswordVisible
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = false;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = true;
                        });
                      },
                      child: Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
            : null,
      ),
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return widget.errorMessage?.isNotEmpty == true
                  ? widget.errorMessage
                  : null;
            }
            return null;
          },
    );
  }
}
