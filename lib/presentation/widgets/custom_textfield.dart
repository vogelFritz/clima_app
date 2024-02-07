import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textController;
  final void Function(String)? onSubmitted;
  final String? hintText;
  const CustomTextField({
    super.key,
    this.textController,
    this.onSubmitted,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        icon: const Icon(Icons.search),
        hintText: hintText,
        suffixIcon: const Icon(Icons.location_city),
      ),
    );
  }
}
