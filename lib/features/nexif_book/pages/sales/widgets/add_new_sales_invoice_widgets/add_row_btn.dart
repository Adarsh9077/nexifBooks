import 'package:flutter/material.dart';

import '../../../../../../common/utils/constants.dart';
import '../../../../../../common/widget/width_spacer.dart';

class AddRowBtn extends StatelessWidget {
  const AddRowBtn({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: 24, color: AppConst.kBlueLight),
          WidthSpacer(width: 5),
          Text(
            "Row",
            style: TextStyle(
              fontSize: 20,
              color: AppConst.kBlueLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
