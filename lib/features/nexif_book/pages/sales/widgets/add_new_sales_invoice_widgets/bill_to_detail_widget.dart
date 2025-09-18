import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/widget/custom_otl_btn.dart';
import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/height_spacer.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../dropdown_search_text_field_widget.dart';
import '../../sales_provider/add_new_sales_invoice_provider.dart';
import '../../sales_provider/row_controller.dart';
import 'add_row_btn.dart';
import 'amount_paid_text_editing_controller.dart';
import 'loading_list_widget.dart';
import 'paid_credit_dropdown_widget.dart';
import 'title_value_row.dart';

class BillToDetailWidget extends ConsumerStatefulWidget {
  const BillToDetailWidget({super.key});

  @override
  ConsumerState<BillToDetailWidget> createState() => _BillToDetailWidgetState();
}

class _BillToDetailWidgetState extends ConsumerState<BillToDetailWidget> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    final initialRows = 4;
    for (int i = 0; i < initialRows; i++) {
      _controllers.add(TextEditingController());
    }
  }

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedBillToId = ref.watch(selectedBillToProvider);
        final billToDetails = ref.watch(
          billToDetailsProvider(selectedBillToId),
        );

        if (selectedBillToId == "Select Bill To") {
          return const SizedBox();
        }

        final rowCount = ref.watch(rowControllerProvider);

        if (_controllers.length < rowCount) {
          _controllers.addAll(
            List.generate(
              rowCount - _controllers.length,
              (_) => TextEditingController(),
            ),
          );
        }

        return billToDetails.when(
          data: (data) {
            String outstanding = data["bookkeeping"]["outstanding"] >= 0
                ? "₹${data["bookkeeping"]["outstanding"]} payment done in advance"
                : "${data["bookkeeping"]["outstanding"]} payment due";
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (data["bookkeeping"]["outstanding"] != 0) ...[
                    HeightSpacer(height: 5),
                    ReusableText(
                      text: outstanding,
                      style: appStyle(16, FontWeight.w400, AppConst.kGreen),
                    ),
                    HeightSpacer(height: 5),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Particulars",
                        style: appStyle(32, FontWeight.w700, AppConst.kBlack),
                      ),
                      AddRowBtn(
                        onPressed: () {
                          ref.read(rowControllerProvider.notifier).state++;
                        },
                      ),
                    ],
                  ),
                  HeightSpacer(height: 5),
                  SizedBox(
                    height: 62.0 * rowCount,
                    child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 1600,
                      fixedLeftColumns: 1,
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
                                  controller: _controllers[i],
                                ),
                              ),
                              DataCell(Text("Row C $i")),
                              DataCell(Text("Row D $i")),
                              DataCell(Text("Row E $i")),
                              DataCell(Text("Row F $i")),
                              DataCell(Text("Row G $i")),
                              DataCell(Text("Row H $i")),
                              DataCell(Text("Row I $i")),
                              DataCell(Text("Row J $i")),
                              DataCell(Text("Row K $i")),
                              DataCell(Text("Row L $i")),
                              DataCell(Text("Row M $i")),
                              DataCell(
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _controllers.removeAt(i);
                                      ref
                                          .read(rowControllerProvider.notifier)
                                          .state--;
                                    });
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
                    ),
                  ),
                  HeightSpacer(height: 15),
                  ReusableText(
                    text: " Paid/Credit",
                    style: appStyle(20, FontWeight.w700, AppConst.kBKDark),
                  ),
                  HeightSpacer(height: 5),
                  PaidCreditDropdownWidget(),
                  HeightSpacer(height: 15),
                  ReusableText(
                    text: " Amount Paid:",
                    style: appStyle(20, FontWeight.w700, AppConst.kBKDark),
                  ),
                  HeightSpacer(height: 5),
                  AmountPaidTextEditingController(controller: amountController),
                  HeightSpacer(height: 15),
                  TitleValueRow(title: " Total Before Tax :", value: "₹0.00"),
                  TitleValueRow(title: " Total IGST :", value: "₹0.00"),
                  TitleValueRow(
                    title: " Total After Tax (Round Off):",
                    value: "₹0.00",
                  ),
                  TitleValueRow(title: " Total in Words:", value: ""),
                  HeightSpacer(height: 15),
                  Center(child: Text("Partial Payment")),
                  HeightSpacer(height: 5),
                  CustomOtlBtn(
                    width: double.infinity,
                    height: 48,
                    color: AppConst.kBlueLight,
                    text: "Submit",
                    iconData: false,
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
