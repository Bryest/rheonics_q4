import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models.dart';
import '../domain/order_code.dart';

final orderSelectionProvider =
    StateNotifierProvider<OrderSelectionController, OrderSelection>((ref) {
  return OrderSelectionController();
});

class OrderSelectionController extends StateNotifier<OrderSelection> {
  OrderSelectionController() : super(OrderSelection.empty());

  void setViscosity(String v) => state = state.copyWith(viscosity: v);
  void setCalibration(String v) => state = state.copyWith(calibration: v);
  void setElectronics(String v) => state = state.copyWith(electronics: v);

  void toggleComm(String c) {
    final list = [...state.comms];
    list.contains(c) ? list.remove(c) : list.add(c);
    state = state.copyWith(comms: list);
  }

  void setTemperature(String v) => state = state.copyWith(temperature: v);
  void setPressure(String v) => state = state.copyWith(pressure: v);
  void setProcessConn(String v) => state = state.copyWith(processConn: v);
}


final orderCodeProvider = Provider<String>((ref) {
  final sel = ref.watch(orderSelectionProvider);
  return buildOrderCode(sel);
});