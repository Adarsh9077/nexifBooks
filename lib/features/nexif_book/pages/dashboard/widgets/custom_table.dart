import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class CustomTable extends ConsumerWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    double screenWidth = MediaQuery.of(context).size.width;
    return Table(
      border: TableBorder.all(),
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(screenWidth * 0.30),
        1: FixedColumnWidth(screenWidth * 0.30),
        2: FixedColumnWidth(screenWidth * 0.30),
      },
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ReusableText(
                  text: "SKU Name",
                  style: appStyle(20, FontWeight.bold, AppConst.kBlack),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ReusableText(
                  text: "Quality",
                  style: appStyle(20, FontWeight.bold, AppConst.kBlack),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ReusableText(
                  text: "Amount",
                  style: appStyle(20, FontWeight.bold, AppConst.kBlack),
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
