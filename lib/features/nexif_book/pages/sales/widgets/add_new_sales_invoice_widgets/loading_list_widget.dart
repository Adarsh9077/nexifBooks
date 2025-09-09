import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListWidget extends StatelessWidget{
  const LoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Container(
            width: 280,
            height: 15,
            margin: EdgeInsets.only(
              bottom: 8,
              top: index == 0 ? 8 : 0,
            ),
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}