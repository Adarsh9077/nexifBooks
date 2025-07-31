import 'package:hooks_riverpod/hooks_riverpod.dart';

final qtyProvider = StateNotifierProvider<QtyController, bool>((ref) {
  return QtyController();
});

final tableProvider = StateNotifierProvider<TableController, bool>((ref) {
  return TableController();
});

class QtyController extends StateNotifier<bool> {
  QtyController() : super(true);

  void toggle() {
    state = !state;
  }
}

class TableController extends StateNotifier<bool> {
  TableController() : super(true);

  void toggle() {
    state = !state;
  }
}
