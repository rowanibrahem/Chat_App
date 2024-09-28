import 'package:chatapp_mentor/core/Routing/routes.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_app_bar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_second_step.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/positioned_next_arrow.dart';
import 'package:flutter/material.dart';

class NewGroupView extends StatelessWidget {
  const NewGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewGroupAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 50,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/marwan.jpg'),
                ),
                title: Text(
                  'Marwan Ali',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '+01125727329',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          PositionedNextArrow(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                 Routes.newGroupSecondStepScreen,
                 );
            },
          ),
        ],
      ),
    );
  }
}
