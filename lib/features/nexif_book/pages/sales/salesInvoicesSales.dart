import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/common/widget/app_style.dart';
import 'package:nexifbook/common/widget/custom_text_field.dart';
import 'package:nexifbook/common/widget/height_spacer.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_invoice_provider.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/sales_provider/sales_items_provider.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/widgets/invoice_tab_view.dart';
import 'package:nexifbook/features/nexif_book/pages/sales/widgets/items_tab_view.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(salesInvoiceProvider.notifier).updateSearch('');
      ref.read(salesItemsProvider.notifier).updateSearch('');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ref.read(salesInvoiceProvider.notifier).updateSearch("");
    ref.read(salesItemsProvider.notifier).updateSearch("");
    tabController.dispose();
    searchController.dispose();
    ref.read(salesInvoiceProvider.notifier).dispose();
    ref.read(salesItemsProvider.notifier).dispose();
    super.dispose();
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // final invoicesAsync = ref.watch(salesInvoiceProvider(searchQuery));
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
                  ref
                      .read(salesInvoiceProvider.notifier)
                      .updateSearch(searchQuery);
                  ref
                      .read(salesItemsProvider.notifier)
                      .updateSearch(searchQuery);
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.search, size: 32, color: AppConst.kBlueLight),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  searchQuery = value;
                  ref
                      .read(salesInvoiceProvider.notifier)
                      .updateSearch(searchQuery);
                  ref
                      .read(salesItemsProvider.notifier)
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
                      InvoiceTabView(query: searchQuery),
                      ItemsTabView(query: searchQuery),
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
