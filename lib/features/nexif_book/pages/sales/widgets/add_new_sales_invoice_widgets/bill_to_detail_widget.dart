import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/height_spacer.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';
import 'add_row_btn.dart';
import 'loading_list_widget.dart';

class BillToDetailWidget extends ConsumerWidget {
  const BillToDetailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedBillToId = ref.watch(selectedBillToProvider);
        final billToDetails = ref.watch(
          billToDetailsProvider(selectedBillToId),
        );

        if (selectedBillToId == "Select Bill To") {
          return SizedBox();
        }
        return billToDetails.when(
          // skipLoadingOnRefresh: false,
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
                                DropdownSearch<String>(
                                  selectedItem: "Select",
                                  items: (filter, infiniteScrollProps) => [
                                    "Menu",
                                    "Dialog",
                                    "Modal",
                                    "BottomSheet",
                                  ],
                                  decoratorProps: DropDownDecoratorProps(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  popupProps: PopupProps.menu(
                                    fit: FlexFit.values[1],
                                    constraints: BoxConstraints(),
                                    showSearchBox: true
                                  ),
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
          error: (error, st) {
            return const Text("error");
          },
          loading: () => const LoadingListWidget(),
        );
      },
    );
  }
}
