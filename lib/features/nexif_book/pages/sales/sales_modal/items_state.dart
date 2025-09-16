import 'items_sales_modal.dart';

class ItemsState {
  final List<ItemsSalesModal> items;
  final String? next;

  const ItemsState({this.items = const [], this.next});

  ItemsState copyWith({
    List<ItemsSalesModal>? items,
    String? next,
  }) {
    return ItemsState(
      items: items ?? this.items,
      next: next,
    );
  }
}
