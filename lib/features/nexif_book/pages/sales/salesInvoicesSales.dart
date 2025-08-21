import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/auth/services/auth_service.dart';
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
void getSalesInvoiceData () async{
  print("object - getSalesInvoiceData");
  var data = await AuthService.getSalesInvoices();
  // print(data);

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("object");
    getSalesInvoiceData();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    getSalesInvoiceData();
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
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        child: DataTableWidget(
                          columnNames: [
                            "S No.",
                            "Id",
                            "First Name",
                            "Last Name",
                            "Age",
                            "DOB",
                            "Role",
                          ],
                        ),
                      ),
                      Container(color: AppConst.kGreen,),
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
