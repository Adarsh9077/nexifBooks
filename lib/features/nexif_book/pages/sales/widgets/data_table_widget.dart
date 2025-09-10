import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class DataTableWidget<T> extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.minWidthTable,
    required this.columnNames,
    required this.dataRowList,
    required this.rowBuilder,
  });

  final double minWidthTable;
  final List<String> columnNames;
  final List<T> dataRowList;
  final List<DataCell> Function(T item, int index) rowBuilder;

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
            minWidth: minWidthTable,
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
                  cells: rowBuilder(dataRowList[i], i),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
