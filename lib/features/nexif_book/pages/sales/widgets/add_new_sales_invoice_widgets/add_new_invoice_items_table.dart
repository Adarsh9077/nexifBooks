import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../common/utils/constants.dart';
import '../../dropdown_search_text_field_widget.dart';
import '../../sales_modal/items_state.dart';
import '../../sales_modal/list_of_items_modal.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';

class AddNewInvoiceItemsTable extends ConsumerWidget {
  AddNewInvoiceItemsTable({
    super.key,
    required this.controllers,
    required this.rowCount,
    required this.deleteRow,
    required this.listOfItems,
  });

  final List<TextEditingController> controllers;
  final int rowCount;
  final void Function() deleteRow;
  final AsyncValue<List<ListOfItemsModal>> listOfItems;
  late final ValueNotifier<AsyncValue<ItemsState>> itemsListenable;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    itemsListenable = ValueNotifier(ref.read(itemsProvider));

    // keep it updated whenever itemsProvider changes
    ref.listen<AsyncValue<ItemsState>>(itemsProvider, (previous, next) {
      itemsListenable.value = next;
    });
    // ref.read(itemsProvider.notifier).loadMore();
    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 1600,
      fixedLeftColumns: 1,
      border: TableBorder.all(width: .5, color: AppConst.kGreyLight),
      columns: const [
        DataColumn2(label: Text('S No.'), fixedWidth: 40),
        DataColumn(label: Text('Item')),
        DataColumn(label: Text('HSN')),
        DataColumn(label: Text('Batch No.')),
        DataColumn(label: Text('Mfg Date')),
        DataColumn(label: Text('Exp Date')),
        DataColumn(label: Text('MRP')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Discount')),
        DataColumn(label: Text('Rate')),
        DataColumn(label: Text('Taxable Amt')),
        DataColumn(label: Text('Gst Rate')),
        DataColumn(label: Text('Total')),
        DataColumn2(fixedWidth: 55, label: Text('Action')),
      ],
      rows: [
        for (int i = 0; i < rowCount; i++)
          DataRow(
            cells: [
              DataCell(Text("${i + 1}")),
              DataCell(
                DropdownSearchTextFieldWidget(
                  controller: controllers[i],
                  listOfDropdownListenable: itemsListenable,
                  onLoadMore: () {
                    // parent triggers provider loadMore (keeps provider/api flow intact)
                    ref.read(itemsProvider.notifier).loadMore();
                  },
                ),
              ),
              DataCell(
                Text(
                  listOfItems.value![i].hsnCode == ""
                      ? " -"
                      : listOfItems.value![i].hsnCode,
                  // (selectedItems2.asData?.value.length ?? 0) > i
                  //     ? selectedItems.asData!.value[i]["hsn_code"].toString()
                  // : "",
                ),
              ),
              DataCell(Text(listOfItems.value![i].batchNo)),
              DataCell(Text(listOfItems.value![i].mfgDate)),
              DataCell(Text(listOfItems.value![i].expDate)),
              DataCell(Text(listOfItems.value![i].mrp.toString())),
              DataCell(Text(listOfItems.value![i].qty.toString())),
              DataCell(Text(listOfItems.value![i].discount.toString())),
              DataCell(Text(listOfItems.value![i].rate.toString())),
              DataCell(Text(listOfItems.value![i].taxableAmt.toString())),
              DataCell(Text(listOfItems.value![i].gstRate.toString())),
              DataCell(Text(listOfItems.value![i].totalAmt.toString())),
              DataCell(
                GestureDetector(
                  // onTap: () {
                  //   setState(() {
                  //     // _controllers.removeAt(i);
                  //
                  //   });
                  // },
                  onTap: () {
                    controllers.removeAt(i);
                    deleteRow();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppConst.kBlueLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.delete_forever_outlined,
                      size: 24,
                      color: AppConst.kLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
