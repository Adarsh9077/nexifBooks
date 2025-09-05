import 'package:hooks_riverpod/hooks_riverpod.dart';

final invoiceDateProvider = StateProvider<String>((ref) {
  return DateTime.now().toString().substring(0, 10);
});
