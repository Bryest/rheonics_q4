import 'models.dart';

String buildOrderCode(OrderSelection s) {
  final comm = s.comms.isEmpty ? '—' : s.comms.join(',');
  return 'SRV-${s.viscosity}-${s.calibration}-${s.electronics}-$comm-${s.temperature}-${s.pressure}-${s.processConn}';
}