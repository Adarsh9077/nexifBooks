// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_invoice_provider.dart';
//
// import '../../../../../common/utils/constants.dart';
// import '../../../../../common/widget/app_style.dart';
// import 'data_table_widget.dart';
//
// class InvoiceTabView extends ConsumerWidget {
//   const InvoiceTabView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final invoicesAsync = ref.watch(salesInvoiceProvider(""));
//     return  invoicesAsync.when(
//       data: (invoice) {
//         // return Text("data - dummy :)__");
//         print("object invoicesAsync func");
//         return Container(
//           color: AppConst.kLight,
//           child: DataTableWidget(
//             columnNames: [
//               "S No.",
//               "Invoice Number",
//               "Invoice Date",
//               "Customer",
//               "Total Amount",
//               "Action",
//               // "Role",
//             ],
//             dataRowList: invoice,
//           ),
//         );
//       },
//       error: (err, _) {
//         return Center(
//           child: TextButton(
//             onPressed: () {},
//             child: Text(
//               "$err",
//               maxLines: 2,
//               style: appStyle(
//                 28,
//                 FontWeight.w400,
//                 Colors.blue,
//               ),
//             ),
//           ),
//         );
//       },
//       loading: () {
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
