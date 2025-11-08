import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/semantics.dart';
import 'package:rheonics_q4/features/order/presentation/widgets/code_card.dart';
import 'package:rheonics_q4/features/order/presentation/widgets/order_sections.dart';
import 'package:rheonics_q4/features/order/state/order_providers.dart';

import '../../../app.dart';
import 'widgets/section_card.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(orderCodeProvider);
    final themeCtl = ref.read(themeModeProvider.notifier);

    final sections = buildOrderSections();

    return Semantics(
      label: "SRV order builder screen",
      hint: "Select configuration options for the SRV sensor.",
      container: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SRV Order Builder'),
          actions: [
            Semantics(
              button: true,
              label: "Toggle light or dark theme",
              child: IconButton(
                tooltip: 'Toggle light/dark',
                icon: const Icon(Icons.brightness_6_rounded),
                onPressed: () {
                  final mode = ref.read(themeModeProvider);
                  themeCtl.state =
                      mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

                  SemanticsService.announce(
                    "Theme changed",
                    TextDirection.ltr,
                  );
                },
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, c) {
            final isWide = c.maxWidth >= 920;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CodeCard(code: code),
                  const SizedBox(height: 16),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: sections.map((sec) {
                          return SizedBox(
                            width: isWide ? (c.maxWidth / 2 - 24) : c.maxWidth,
                            child: SectionCard(
                              title: sec.title,
                              child: sec.builder(ref),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
