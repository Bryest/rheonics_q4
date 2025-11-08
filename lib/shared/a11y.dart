import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Screen-reader announcement (falls back to SnackBar on web if needed)
void announce(BuildContext context, String msg) {
  // SemanticsService.announce works on web for live regions; keep SnackBar too
  SemanticsService.announce(msg, TextDirection.ltr);
  if (kIsWeb) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), behavior: SnackBarBehavior.floating, duration: const Duration(seconds: 2)),
    );
  }
}
