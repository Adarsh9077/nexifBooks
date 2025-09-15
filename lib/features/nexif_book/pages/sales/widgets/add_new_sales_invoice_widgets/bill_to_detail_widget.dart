import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/height_spacer.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../dropdown_search_text_field_widget.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';
import 'add_row_btn.dart';
import 'loading_list_widget.dart';

class BillToDetailWidget extends ConsumerStatefulWidget {
  const BillToDetailWidget({super.key});

  @override
  ConsumerState<BillToDetailWidget> createState() => _BillToDetailWidgetState();
}
// class _BillToDetailWidgetState extends ConsumerState<BillToDetailWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         final selectedBillToId = ref.watch(selectedBillToProvider);
//         final billToDetails = ref.watch(
//           billToDetailsProvider(selectedBillToId),
//         );
//
//         if (selectedBillToId == "Select Bill To") {
//           return SizedBox();
//         }
//         return billToDetails.when(
//           // skipLoadingOnRefresh: false,
//           data: (data) {
//             String outstanding = data["bookkeeping"]["outstanding"] >= 0
//                 ? "₹${data["bookkeeping"]["outstanding"]} payment done in advance"
//                 : "${data["bookkeeping"]["outstanding"]} payment due";
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   HeightSpacer(height: 5),
//                   data["bookkeeping"]["outstanding"] != 0
//                       ? Column(
//                           children: [
//                             ReusableText(
//                               text: outstanding,
//                               style: appStyle(
//                                 16,
//                                 FontWeight.w400,
//                                 AppConst.kGreen,
//                               ),
//                             ),
//                             HeightSpacer(height: 5),
//                           ],
//                         )
//                       : SizedBox(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ReusableText(
//                         text: "Particulars",
//                         style: appStyle(32, FontWeight.w700, AppConst.kBlack),
//                       ),
//                       AddRowBtn(onPressed: () {}),
//                     ],
//                   ),
//                   HeightSpacer(height: 5),
//                   SizedBox(
//                     height: 280,
//                     child: DataTable2(
//                       columnSpacing: 12,
//                       horizontalMargin: 12,
//                       minWidth: 1600,
//                       fixedLeftColumns: 1,
//                       columns: [
//                         DataColumn2(label: Text('S No.'), fixedWidth: 40),
//                         DataColumn(label: Text('Item')),
//                         DataColumn(label: Text('HSN')),
//                         DataColumn(label: Text('Batch No.')),
//                         DataColumn(label: Text('Mfg Date')),
//                         DataColumn(label: Text('Exp Date')),
//                         DataColumn(label: Text('MRP')),
//                         DataColumn(label: Text('Quantity')),
//                         DataColumn(label: Text('Discount')),
//                         DataColumn(label: Text('Rate')),
//                         DataColumn(label: Text('Taxable Amt')),
//                         DataColumn(label: Text('Gst Rate')),
//                         DataColumn(label: Text('Total')),
//                         DataColumn(label: Text('Action')),
//                       ],
//                       rows: [
//                         for (int i = 0; i < 4; i++)
//                           DataRow(
//                             cells: [
//                               DataCell(Text("${i + 1}")),
//                               DataCell(
//                                 SizedBox(
//                                   width: 200,
//                                   child: StatefulBuilder(
//                                     builder: (context, setState) {
//                                       final TextEditingController
//                                       controller = TextEditingController();
//                                       final String selectedValue = ref.watch(
//                                         selectedTableItemProvider,
//                                       );
//                                       controller.text = selectedValue;
//                                       return TypeAheadField<String>(
//                                         suggestionsCallback: (pattern) async {
//                                           return [
//                                             "India",
//                                             "USA",
//                                             "Canada",
//                                             "Australia",
//                                           ]
//                                               .where(
//                                                 (item) => item.toLowerCase().contains(
//                                               pattern.toLowerCase(),
//                                             ),
//                                           )
//                                               .toList();
//                                         },
//                                         builder: (context, controller, focusNode) {
//                                           return TextField(
//                                             controller: controller, // ✅ must use provided controller
//                                             focusNode: focusNode,
//                                             decoration: const InputDecoration(
//                                               labelText: 'Search Country',
//                                               border: OutlineInputBorder(),
//                                               contentPadding: EdgeInsets.symmetric(
//                                                 horizontal: 8,
//                                                 vertical: 6,
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         itemBuilder: (context, suggestion) {
//                                           return ListTile(
//                                             dense: true,
//                                             title: Text(suggestion),
//                                           );
//                                         },
//                                         onSelected: (value) {
//                                           // ✅ 1. Update textfield automatically
//                                           // (already handled by TypeAheadField using its controller)
//                                           // but we can force set again for safety:
//                                           controller.text = value;
//
//                                           // ✅ 2. Update Riverpod provider
//                                           ref.read(selectedTableItemProvider.notifier).state = value;
//
//                                           // ✅ 3. Close keyboard
//                                           FocusScope.of(context).unfocus();
//                                         },
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               DataCell(Text("Row C")),
//                               DataCell(Text("Row D")),
//                               DataCell(Text("Row E")),
//                               DataCell(Text("Row F")),
//                               DataCell(Text("Row G")),
//                               DataCell(Text("Row H")),
//                               DataCell(Text("Row I")),
//                               DataCell(Text("Row J")),
//                               DataCell(Text("Row K")),
//                               DataCell(Text("Row L")),
//                               DataCell(Text("Row M")),
//                               DataCell(Text("Row N")),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           error: (error, st) {
//             return const Text("error");
//           },
//           loading: () => const LoadingListWidget(),
//         );
//       },
//     );
//   }
// }

class _BillToDetailWidgetState extends ConsumerState<BillToDetailWidget> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedBillToId = ref.watch(selectedBillToProvider);
        final billToDetails = ref.watch(
          billToDetailsProvider(selectedBillToId),
        );

        if (selectedBillToId == "Select Bill To") {
          return SizedBox();
        }
        // final fetchListOfItemsData = ref.watch(fetchListOfItemsProvider(""));
        // print(
        //   "Fetched -> ${fetchListOfItemsData} \n+++++++++++++++++++++++++++",
        // );
        return billToDetails.when(
          data: (data) {
            String outstanding = data["bookkeeping"]["outstanding"] >= 0
                ? "₹${data["bookkeeping"]["outstanding"]} payment done in advance"
                : "${data["bookkeeping"]["outstanding"]} payment due";
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeightSpacer(height: 5),
                  data["bookkeeping"]["outstanding"] != 0
                      ? Column(
                          children: [
                            ReusableText(
                              text: outstanding,
                              style: appStyle(
                                16,
                                FontWeight.w400,
                                AppConst.kGreen,
                              ),
                            ),
                            HeightSpacer(height: 5),
                          ],
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableText(
                        text: "Particulars",
                        style: appStyle(32, FontWeight.w700, AppConst.kBlack),
                      ),
                      AddRowBtn(onPressed: () {}),
                    ],
                  ),
                  HeightSpacer(height: 5),
                  SizedBox(
                    height: 280,
                    child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 1600,
                      fixedLeftColumns: 1,
                      columns: [
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
                        DataColumn(label: Text('Action')),
                      ],
                      rows: [
                        for (int i = 0; i < 4; i++)
                          DataRow(
                            cells: [
                              DataCell(Text("${i + 1}")),
                              DataCell(
                                DropdownSearchTextFieldWidget(
                                  controller: _controllers[i],
                                ),
                              ),
                              DataCell(Text("Row C")),
                              DataCell(Text("Row D")),
                              DataCell(Text("Row E")),
                              DataCell(Text("Row F")),
                              DataCell(Text("Row G")),
                              DataCell(Text("Row H")),
                              DataCell(Text("Row I")),
                              DataCell(Text("Row J")),
                              DataCell(Text("Row K")),
                              DataCell(Text("Row L")),
                              DataCell(Text("Row M")),
                              DataCell(Text("Row N")),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (_, __) => const Text("error"),
          loading: () => const LoadingListWidget(),
        );
      },
    );
  }
}
