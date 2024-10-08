import 'package:flutter/material.dart';

class MutedUpdatesListView extends StatelessWidget {
  const MutedUpdatesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
      ),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/marwan.jpg'),
            ),
            title: Text('Marwan Ali'),
            subtitle: Text('Today, 12:00 PM'),
          );
        },
      ),
    );
  }
}
