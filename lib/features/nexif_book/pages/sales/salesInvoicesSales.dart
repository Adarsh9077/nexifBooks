import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_modal/sales_invoice_modal.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_invoice_provider.dart';
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

  Future<List<SalesInvoicesModal>> getSalesInvoiceData({
    String query = "",
  }) async {
    List<SalesInvoicesModal> invoice = [];
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
    getSalesInvoiceData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    print("object build func");
    final Size screenSize = MediaQuery.of(context).size;
    final invoicesAsync = ref.watch(salesInvoiceProvider(searchQuery));
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
              suffixIcon: IconButton(
                onPressed: () {
                  searchQuery = searchController.text.toString();
                  ref.invalidate(salesInvoiceProvider(searchQuery));
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.search, size: 32, color: AppConst.kBlueLight),
              ),
            ),
            HeightSpacer(height: 12),
            SizedBox(
              height: 46,
              child: CustomTabBar(tabController: tabController),
            ),
            HeightSpacer(height: 12),
            Expanded(
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      invoicesAsync.when(
                        skipLoadingOnRefresh: false,
                        data: (invoice) {
                          // return Text("data - dummy :)__");
                          print("object invoicesAsync func");
                          return Container(
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
                              dataRowList: invoice,
                            ),
                          );
                        },
                        error: (err, _) {
                          return Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "$err",
                                maxLines: 2,
                                style: appStyle(
                                  28,
                                  FontWeight.w400,
                                  Colors.blue,
                                ),
                              ),
                            ),
                          );
                        },
                        loading: () {
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      Container(color: AppConst.kGreen),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
