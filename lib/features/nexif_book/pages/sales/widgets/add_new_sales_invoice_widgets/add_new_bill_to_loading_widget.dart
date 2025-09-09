import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/utils/constants.dart';

class AddNewBillToLoadingWidget extends StatelessWidget {
  const AddNewBillToLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 45,
      padding: EdgeInsets.only(
        left: 16,
        right: 12,
        top: 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppConst.kBlueLight, width: .5),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
        child: Container(
          width: 280,
          height: 15,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
