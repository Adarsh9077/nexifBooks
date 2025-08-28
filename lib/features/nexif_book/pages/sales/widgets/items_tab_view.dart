import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_items_provider.dart';
import 'package:number_paginator/number_paginator.dart';
import 'data_table_widget.dart';

class ItemsTabView extends ConsumerWidget {
  const ItemsTabView({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoicesAsync = ref.watch(salesItemsProvider);
    final controller = ref.read(
      salesItemsProvider.notifier,
    );
    final currentPage = controller.currentPage;

    return invoicesAsync.when(
      data: (invoice) {
        int totalCount = invoice?.count ?? 0;
        int noOfPages = (totalCount / 10).ceil();

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Expanded(
              DataTableWidget(
                columnNames: const [
                  "S No.",
                  "Items",
                  "Invoice Number",
                  "Invoice Date",
                  "Customer",
                  "Batch",
                  // "MRP",
                  // "Qty",
                  // "Discount",
                  // "Total Before Tax",
                  // "GST",
                  // "Total after Tax",
                  // "Action",
                ],
                dataRowList: invoice?.results ?? [],
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
