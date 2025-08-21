import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/reusable_text.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
    required this.columnNames,
  });

  final List<String> columnNames;

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
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('01')),
                DataCell(Text('101')),
                DataCell(Text('Sarah')),
                DataCell(Text('Singh')),
                DataCell(Text('19')),
                DataCell(Text('2004')),
                DataCell(Text('Student')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('02')),
                DataCell(Text('102')),
                DataCell(Text('Janine')),
                DataCell(Text('Disuza')),
                DataCell(Text('43')),
                DataCell(Text('1983')),
                DataCell(Text('Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('03')),
                DataCell(Text('103')),
                DataCell(Text('William')),
                DataCell(Text('Shakespeare')),
                DataCell(Text('27')),
                DataCell(Text('1998')),
                DataCell(Text('Associate Professor')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
