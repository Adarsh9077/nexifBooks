import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/widgets/data_table_widget.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';
import 'widgets/custom_tab_bar.dart';

class SalesInvoicesSales extends ConsumerStatefulWidget {
  const SalesInvoicesSales({super.key});

  @override
  ConsumerState<SalesInvoicesSales> createState() => _SalesInvoicesSalesState();
}

class _SalesInvoicesSalesState extends ConsumerState<SalesInvoicesSales>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  Future<List<SalesInvoicesModal>> getSalesInvoiceData() async {
    List<SalesInvoicesModal> invoice = [];
    print("object - getSalesInvoiceData");
    var data = await AuthService.getSalesInvoices();
    for (Map<String, dynamic> index in data) {
      invoice.add(
        SalesInvoicesModal(
          invoiceId: index["id"],
          invoiceNumber: index["number"].toString(),
          invoiceDate: index["date"].toString(),
          totalAmount: index["totalAmount"].toString(),
          customer: index["customer"]["name"].toString(),
        ),
      );
    }

    return invoice;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    getSalesInvoiceData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Invoice", isHomePage: false),
      backgroundColor: AppConst.kLight,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF4096FF),
        onPressed: () {},
        child: Icon(Icons.add, color: AppConst.kLight, size: 30),
      ),
      body: Container(
        padding: EdgeInsets.all(AppConst.kPadding),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              width: screenSize.width,
              hintText: "Search",
              hintStyle: appStyle(20, FontWeight.w400, AppConst.kGreyLight),
            ),
            HeightSpacer(height: 12),
            SizedBox(
              height: 46,
              child: CustomTabBar(tabController: tabController),
            ),
            HeightSpacer(height: 12),
            Expanded(
              child: FutureBuilder(
                future: getSalesInvoiceData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(
                              color: AppConst.kLight,
                              child: DataTableWidget(
                                columnNames: [
                                  "S No.",
                                  "Invoice Number",
                                  "Invoice Date",
                                  "Customer",
                                  "Total Amount",
                                  "Action",
                                  // "Role",
                                ],
                                dataRowList: snapshot.data,
                              ),
                            ),
                            Container(color: AppConst.kGreen),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
