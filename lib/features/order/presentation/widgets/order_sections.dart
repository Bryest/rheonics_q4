import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rheonics_q4/features/order/data/options.dart';
import 'package:rheonics_q4/features/order/presentation/widgets/multi_select.dart';
import 'package:rheonics_q4/features/order/presentation/widgets/single_select.dart';
import 'package:rheonics_q4/features/order/state/order_providers.dart';

class OrderSection {
  final String title;
  final Widget Function(WidgetRef ref) builder;

  OrderSection({
    required this.title,
    required this.builder,
  });
}

List<OrderSection> buildOrderSections() {
  return [
    OrderSection(
      title: "Viscosity range",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "V1..V4",
          value: s.viscosity,
          options: viscosityOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setViscosity(v),
        );
      },
    ),
    OrderSection(
      title: "Calibration",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "STD / CUS",
          value: s.calibration,
          options: calibrationOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setCalibration(v),
        );
      },
    ),
    OrderSection(
      title: "Electronics",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "E1 / E2 / E3",
          value: s.electronics,
          options: electronicsOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setElectronics(v),
        );
      },
    ),
    OrderSection(
      title: "Communication (multi-select)",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return MultiSelectChips(
          label: "C1..C9",
          options: communicationOptions,
          selected: s.comms.toSet(),
          onToggled: (v) => ref.read(orderSelectionProvider.notifier).toggleComm(v),
        );
      },
    ),
    OrderSection(
      title: "Temperature",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "T1..T4",
          value: s.temperature,
          options: temperatureOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setTemperature(v),
        );
      },
    ),
    OrderSection(
      title: "Pressure",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "P1..P5",
          value: s.pressure,
          options: pressureOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setPressure(v),
        );
      },
    ),
    OrderSection(
      title: "Process connection",
      builder: (ref) {
        final s = ref.watch(orderSelectionProvider);
        return SingleSelect(
          label: "X1..X5",
          value: s.processConn,
          options: processConnOptions,
          onChanged: (v) => ref.read(orderSelectionProvider.notifier).setProcessConn(v),
        );
      },
    ),
  ];
}
