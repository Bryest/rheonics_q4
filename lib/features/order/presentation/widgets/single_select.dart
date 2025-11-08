import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class SingleSelect extends StatelessWidget {
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const SingleSelect({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "$label selector",
      hint: "Double tap to open list of options. Current value: $value.",
      button: true,
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: InputDecoration(labelText: label),
        items: options
            .map((o) =>
            DropdownMenuItem(value: o, child: Text(o)))
            .toList(),
        onChanged: (v) {
          if (v != null) {
            SemanticsService.announce("$label changed to $v", TextDirection.ltr);
            onChanged(v);
          }
        },
      ),
    );
  }
}
