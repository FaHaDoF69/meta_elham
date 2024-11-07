import 'package:flutter/material.dart';

class CustomRadioGroup extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  const CustomRadioGroup({
    super.key,
    required this.labelText,
    required this.options,
    this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Column(
          children: options
              .map((option) => RadioListTile(
                    title: Text(option),
                    value: option,
                    groupValue: selectedOption,
                    onChanged: onChanged,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
