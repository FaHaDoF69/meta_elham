import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFieldWidget({
    this.label,
    this.hint,
    this.inputType,
    this.controller,
    this.obscureText = false,
    this.validator,
    super.key,
  });

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: const TextStyle(fontSize: 16)),
        if (widget.label != null) const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: widget.controller,
                keyboardType: widget.inputType,
                obscureText: widget.obscureText,
                validator: widget.validator,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: widget.hint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ],
          ),
        ),
        // if (_errorText != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 5.0, left: 5.0),
        //     child: Text(
        //       _errorText!,
        //       style: const TextStyle(color: Colors.red, fontSize: 12),
        //     ),
        //   ),
      ],
    );
  }
}
