import 'package:flutter/material.dart';
import 'package:nexifbook/common/utils/constants.dart';

class AmountPaidTextEditingController extends StatelessWidget {
  const AmountPaidTextEditingController({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 48,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          prefixIcon: Icon(Icons.currency_rupee),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: .5, color: AppConst.kBlueLight),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: .5, color: AppConst.kBlueLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: .5, color: AppConst.kBlueLight),
          ),
        ),
      ),
    );
  }
}
