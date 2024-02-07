import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textController;
  final void Function(String)? onSubmitted;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  const CustomTextField({
    super.key,
    this.textController,
    this.onSubmitted,
    this.hintText,
    this.hintStyle,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        errorText: errorText,
        icon: const Icon(Icons.search),
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: const Icon(Icons.location_city),
      ),
    );
  }
}
