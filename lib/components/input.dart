import 'package:ard_light/components/text_view.dart';
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
  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorMessage,
    this.filled,
    this.label,
    this.fillColor,
    this.isPhone,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
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

  void _onTextChanged() {
    setState(() {}); // Rebuild when text changes
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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
        label: widget.label != null && widget.controller.text.isNotEmpty
            ? TextView(
                text: widget.label!,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              )
            : null,
        hintText: widget.hintText,
        filled: widget.filled,
        fillColor: widget.fillColor,
        errorStyle: TextStyle(color: Colors.red),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
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
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
    );
  }
}
