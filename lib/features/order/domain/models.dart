import 'package:collection/collection.dart';

class OrderSelection {
  final String viscosity;     // V1..V4
  final String calibration;   // STD/CUS
  final String electronics;   // E1/E2/E3
  final List<String> comms;   // C1..C9 (multi)
  final String temperature;   // T1..T4
  final String pressure;      // P1..P5
  final String processConn;   // X1..X5

  const OrderSelection({
    required this.viscosity,
    required this.calibration,
    required this.electronics,
    required this.comms,
    required this.temperature,
    required this.pressure,
    required this.processConn,
  });

  factory OrderSelection.empty() => const OrderSelection(
        viscosity: 'V1',
        calibration: 'STD',
        electronics: 'E1',
        comms: <String>[],
        temperature: 'T1',
        pressure: 'P1',
        processConn: 'X1',
      );

  OrderSelection copyWith({
    String? viscosity,
    String? calibration,
    String? electronics,
    List<String>? comms,
    String? temperature,
    String? pressure,
    String? processConn,
  }) {
    return OrderSelection(
      viscosity: viscosity ?? this.viscosity,
      calibration: calibration ?? this.calibration,
      electronics: electronics ?? this.electronics,
      comms: comms ?? this.comms,
      temperature: temperature ?? this.temperature,
      pressure: pressure ?? this.pressure,
      processConn: processConn ?? this.processConn,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderSelection &&
          viscosity == other.viscosity &&
          calibration == other.calibration &&
          electronics == other.electronics &&
          const ListEquality<String>().equals(comms, other.comms) &&
          temperature == other.temperature &&
          pressure == other.pressure &&
          processConn == other.processConn;

  @override
  int get hashCode => Object.hash(
        viscosity,
        calibration,
        electronics,
        const ListEquality<String>().hash(comms),
        temperature,
        pressure,
        processConn,
      );

  @override
  String toString() =>
      'OrderSelection(viscosity: $viscosity, calibration: $calibration, '
      'electronics: $electronics, comms: $comms, temperature: $temperature, '
      'pressure: $pressure, processConn: $processConn)';
}
