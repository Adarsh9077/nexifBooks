import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nexifbook/common/utils/constants.dart';
import 'package:nexifbook/features/nexif_book/pages/dashboard/widgets/custom_table_bar-chart.dart';
import 'package:nexifbook/features/nexif_book/widgets/app_bar.dart';

class PurchaseDashboard extends ConsumerStatefulWidget {
  const PurchaseDashboard({super.key});

  @override
  ConsumerState<PurchaseDashboard> createState() =>
      _PurchaseDashboardState();
}

class _PurchaseDashboardState extends ConsumerState<PurchaseDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return SizedBox();
        },
      ),
      backgroundColor: AppConst.kLight,
      appBar: const CustomAppBar(
        title: "Purchase Dashboard",
        isHomePage: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Scaffold.of(context).
          return Future<void>.delayed(const Duration(seconds: 3));

        },
        notificationPredicate: (ScrollNotification notification) {
          return notification.depth == 1;
        },
        color: AppConst.kBlueLight,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(AppConst.kPadding),
                color: AppConst.kLight,
                height: MediaQuery.of(context).size.height - 100,
                child: ListView(children: [CustomTableBarChart()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
