import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';
import 'sales_provider/sales_return_invoice_provider.dart';
import 'sales_provider/sales_return_item_provider.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/sales_return_invoice_tab_view.dart';
import 'widgets/sales_return_item_tab_view.dart';

class SalesReturnsSales extends ConsumerStatefulWidget {
  const SalesReturnsSales({super.key});

  @override
  ConsumerState<SalesReturnsSales> createState() => _SalesReturnsSalesState();
}

class _SalesReturnsSalesState extends ConsumerState<SalesReturnsSales>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(salesReturnInvoiceProvider.notifier).updateSearch('');
      ref.read(salesReturnItemsProvider.notifier).updateSearch('');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ref.read(salesReturnInvoiceProvider.notifier).updateSearch("");
    ref.read(salesReturnItemsProvider.notifier).updateSearch("");
    tabController.dispose();
    searchController.dispose();
    ref.read(salesReturnInvoiceProvider.notifier).dispose();
    ref.read(salesReturnItemsProvider.notifier).dispose();
    super.dispose();
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Return", isHomePage: false),
      backgroundColor: AppConst.kLight,
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
                  ref
                      .read(salesReturnInvoiceProvider.notifier)
                      .updateSearch(searchQuery);
                  ref
                      .read(salesReturnItemsProvider.notifier)
                      .updateSearch(searchQuery);
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.search, size: 32, color: AppConst.kBlueLight),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  searchQuery = value;
                  ref
                      .read(salesReturnInvoiceProvider.notifier)
                      .updateSearch(searchQuery);
                  ref
                      .read(salesReturnItemsProvider.notifier)
                      .updateSearch(searchQuery);
                  FocusScope.of(context).unfocus();
                }
              },
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
                      SalesReturnInvoiceTabView(query: searchQuery),
                      SalesReturnItemTabView(query: searchQuery),
                      // ItemsTabView(query: searchQuery),
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
