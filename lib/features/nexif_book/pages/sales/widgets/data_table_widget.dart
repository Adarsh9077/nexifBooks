import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.columnNames,
    required this.dataRowList,
  });

  final List<String> columnNames;
  final List<SalesInvoicesModal> dataRowList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // controller: PageController(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          showCheckboxColumn: true,
          columns: <DataColumn>[
            for (int i = 0; i < columnNames.length; i++)
              DataColumn(
                label: Expanded(
                  child: ReusableText(
                    text: columnNames[i],
                    style: appStyle(16, FontWeight.w600, AppConst.kBlack),
                  ),
                ),
              ),
          ],
          rows: <DataRow>[
            for (int i = 0; i < dataRowList.length; i++)
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    ReusableText(
                      text: "${i + 1}",
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ),
                  DataCell(
                    ReusableText(
                      text: '${dataRowList[i].invoiceNumber}',
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ), DataCell(
                    ReusableText(
                      text: '${dataRowList[i].invoiceDate}',
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ), DataCell(
                    ReusableText(
                      text: '${dataRowList[i].customer}',
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ), DataCell(
                    ReusableText(
                      text: '${dataRowList[i].totalAmount}',
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ), DataCell(
                    ReusableText(
                      text: '${dataRowList[i].invoiceId}',
                      style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
