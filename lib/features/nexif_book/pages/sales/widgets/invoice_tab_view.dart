import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_invoice_provider.dart';
import 'package:number_paginator/number_paginator.dart';
import 'data_table_widget.dart';

class InvoiceTabView extends ConsumerWidget {
  const InvoiceTabView({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoicesAsync = ref.watch(salesInvoiceProvider);
    final controller = ref.read(
      salesInvoiceProvider.notifier,
    ); // NEW: read notifier
    final currentPage = controller.currentPage; // NEW: get current page

    return invoicesAsync.when(
      data: (invoice) {
        int totalCount = invoice?.count ?? 0;
        int noOfPages = (totalCount / 10).ceil();

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              DataTableWidget<SalesInvoicesModal>(
                minWidthTable: 780,
                columnNames: const [
                  "S No.",
                  "Invoice Number",
                  "Invoice Date",
                  "Customer",
                  "Total Amount",
                  "Action",
                ],
                dataRowList: invoice!.results,
                rowBuilder: (item, index) {
                  return [
                    DataCell(
                      ReusableText(
                        text: "${index + 1}",
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${item.invoiceNumber}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${item.invoiceDate}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${item.customer}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${item.totalAmount}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 155,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppConst.kBlueLight,
                                size: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.print,
                                color: AppConst.kBlueLight,
                                size: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_forever,
                                color: AppConst.kRed,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
              ),
              // ),
              if (noOfPages > 1)
                NumberPaginator(
                  numberPages: noOfPages,
                  initialPage: currentPage - 1,
                  onPageChange: (int index) {
                    controller.goToPage("${index + 1}");
                  },
                  child: const SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        PrevButton(),
                        Expanded(
                          child: NumberContent(
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        NextButton(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      error: (err, _) => Text("Error: $err"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
