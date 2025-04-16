import 'package:flutter/material.dart';

class TSearchtextField extends StatefulWidget {
  const TSearchtextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final VoidCallback onSubmit;

  @override
  State<TSearchtextField> createState() => _SSearchtextFieldState();
}

class _SSearchtextFieldState extends State<TSearchtextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {}); // update UI
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: widget.controller,
        onSubmitted: (value) {
          widget.onSubmit();
        },
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: .2),
          ),
          suffixIcon: IconButton(
            icon:
                widget.controller.text.isEmpty
                    ? const Icon(Icons.search)
                    : const Icon(Icons.clear),
            onPressed: () {
              widget.controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
