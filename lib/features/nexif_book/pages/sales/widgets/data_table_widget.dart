import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:data_table_2/data_table_2.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.columnNames,
    required this.dataRowList,
  });

  final List<String> columnNames;
  final List<dynamic> dataRowList;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.58,
          width: double.infinity,
          child: DataTable2(
            showCheckboxColumn: true,
            columnSpacing: 2,
            horizontalMargin: 1,
            minWidth: 900,
            fixedLeftColumns: 1,
            columns: [
              for (int i = 0; i < columnNames.length; i++)
                DataColumn2(
                  fixedWidth: i == 0 ? 50 : null,
                  label: Text(
                    columnNames[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
            ],
            rows: [
              for (int i = 0; i < dataRowList.length; i++)
                DataRow(
                  cells: [
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
                    ),
                    DataCell(
                      ReusableText(
                        text: '${dataRowList[i].invoiceDate}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${dataRowList[i].customer}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      ReusableText(
                        text: '${dataRowList[i].invoiceId}',
                        style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      ),
                    ),
                    DataCell(
                      // ReusableText(
                      //   text: '${dataRowList[i].invoiceId}',
                      //   style: appStyle(14, FontWeight.w400, AppConst.kBlack),
                      // ),
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
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
