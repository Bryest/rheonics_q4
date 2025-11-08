import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class MultiSelectChips extends StatelessWidget {
  final String label;
  final List<String> options;
  final Set<String> selected;
  final ValueChanged<String> onToggled;

  const MultiSelectChips({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "$label multi-select",
      hint: "Double tap to toggle each option",
      container: true,
      child: Wrap(
        spacing: 8,
        children: options.map((opt) {
          final isSel = selected.contains(opt);
          return Semantics(
            button: true,
            toggled: isSel,
            label: opt,
            hint: isSel ? "Selected. Double tap to unselect." : "Not selected. Double tap to select.",
            child: FilterChip(
              label: Text(opt),
              selected: isSel,
              onSelected: (_) {
                SemanticsService.announce(
                  isSel ? "$opt removed" : "$opt selected",
                  TextDirection.ltr,
                );
                onToggled(opt);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
