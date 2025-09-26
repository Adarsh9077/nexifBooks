import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../sales_modal/list_of_items_modal.dart';

class ListOfItemsNotifier
    extends StateNotifier<AsyncValue<List<ListOfItemsModal>>> {
  ListOfItemsNotifier() : super(const AsyncValue.data([])) {
    _initItems();
  }

  final List<ListOfItemsModal> _listOfItems = [];

  void _initItems() {
    for (int i = 0; i < 4; i++) {
      _listOfItems.add(
        ListOfItemsModal(
          discount: 0,
          mrp: 0,
          batchNo: "",
          expDate: "",
          gstRate: 0,
          hsnCode: "",
          id: i,
          item: "",
          itemId: 0,
          mfgDate: "",
          qty: 0,
          rate: 0,
          taxableAmt: 0,
          totalAmt: 0,
        ),
      );
    }
    state = AsyncValue.data(List.from(_listOfItems));
  }

  Future<List<ListOfItemsModal>> fetchListOfItems() async {
    try {
      return _listOfItems;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

//   Future<List<ListOfItemsModal>> updateListOfItems(
//     int id,
//     ListOfItemsModal item,
//     int? totalAmt,
//   ) async {
//     try {
//       _listOfItems[id] = item.copyWith(id: id, totalAmt: totalAmt);
//       // state = AsyncValue.data(List.from(_listOfItems));
//       return _listOfItems;
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//       rethrow;
//     }
//   }
  Future<List<ListOfItemsModal>> updateListOfItems(
      int index, {
        int? id,
        int? itemId,
        String? item,
        String? hsnCode,
        String? batchNo,
        String? mfgDate,
        String? expDate,
        double? mrp,
        double? qty,
        double? discount,
        double? rate,
        double? taxableAmt,
        double? gstRate,
        double? totalAmt,
      }) async {
    try {
      final oldItem = _listOfItems[index];

      final updatedItem = oldItem.copyWith(
        id: id ?? oldItem.id,
        itemId: itemId ?? oldItem.itemId,
        item: item ?? oldItem.item,
        hsnCode: hsnCode ?? oldItem.hsnCode,
        batchNo: batchNo ?? oldItem.batchNo,
        mfgDate: mfgDate ?? oldItem.mfgDate,
        expDate: expDate ?? oldItem.expDate,
        mrp: mrp ?? oldItem.mrp,
        discount: discount ?? oldItem.discount,
        taxableAmt: taxableAmt ?? oldItem.taxableAmt,
        gstRate: gstRate ?? oldItem.gstRate,
        qty: qty ?? oldItem.qty,
        rate: rate ?? oldItem.rate,
        totalAmt: totalAmt ?? oldItem.totalAmt,
      );

      _listOfItems[index] = updatedItem;

      state = AsyncValue.data(List.from(_listOfItems));
      return _listOfItems;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

}

final listOfItemsNotifierProvider =
    StateNotifierProvider<
      ListOfItemsNotifier,
      AsyncValue<List<ListOfItemsModal>>
    >((ref) => ListOfItemsNotifier());
