import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';

class CodeCard extends StatelessWidget {
  final String code;

  const CodeCard({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Generated order code",
      hint: "This is the final SRV configuration code.",
      readOnly: true,
      container: true,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: const Text('Generated order code'),
          subtitle: Semantics(
            label: "Order code value",
            value: code,
            child: SelectableText(
              code,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          trailing: Semantics(
            button: true,
            label: "Copy order code",
            hint: "Double tap to copy the code to the clipboard.",
            child: IconButton(
              tooltip: 'Copy',
              icon: const Icon(Icons.copy_all_rounded),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                SemanticsService.announce("Order code copied", TextDirection.ltr);
              },
            ),
          ),
        ),
      ),
    );
  }
}
