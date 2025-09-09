import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/app_style.dart';
import '../../../../../../common/widget/reusable_text.dart';
import '../../../../../auth/services/auth_service.dart';

class InvoiceNumberWidget extends StatelessWidget {
  const InvoiceNumberWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 48,
      padding: EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppConst.kBlueLight, width: .5),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FutureBuilder(
          future: AuthService.getSalesNewInvoiceId(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 15,
                  width: 189,
                  color: Colors.grey.shade500,
                ),
              );
            } else {
              return ReusableText(
                text: "${snapshot.data["next"]}",
                style: appStyle(18, FontWeight.w600, AppConst.kGreyLight),
              );
            }
          },
        ),
      ),
    );
  }
}
