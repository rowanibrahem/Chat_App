import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ChatsShimmer extends StatelessWidget {
  const ChatsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
            ),
            title: Container(
              width: 100,
              height: 10,
              color: Colors.grey[300],
            ),
            subtitle: Container(
              width: 150,
              height: 10,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }
}
