import 'package:chatapp_mentor/features/status/presentation/views/widgets/updates_state_title.dart';
import 'package:flutter/material.dart';

class CallsViewBody extends StatelessWidget {
  const CallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const GreyTitleWithPadding(title: 'Recent'),
        ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/marwan.jpg'),
              ),
              title: Text(
                'Marwan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Today, 10:30 AM',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              trailing: Icon(Icons.call),
            );
          },
        ),
      ],
    );
  }
}
