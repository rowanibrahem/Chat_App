import 'package:chatapp_mentor/features/status/presentation/views/widgets/add_status_list_tile.dart';
import 'package:chatapp_mentor/features/status/presentation/views/widgets/muted_updates_list_view.dart';
import 'package:chatapp_mentor/features/status/presentation/views/widgets/recent_updates_list_view.dart';
import 'package:chatapp_mentor/features/status/presentation/views/widgets/updates_state_title.dart';
import 'package:chatapp_mentor/features/status/presentation/views/widgets/viewed_updates_list_view.dart';
import 'package:flutter/material.dart';

class StatusViewBody extends StatelessWidget {
  const StatusViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        AddStatusListTile(),
        UpdatesStateTitle(title: 'Recent updates'),
        RecentUpdatesListView(),
        SizedBox(height: 10),
        UpdatesStateTitle(title: 'Viewed updates'),
        SizedBox(height: 10),
        ViewedUpdatesListView(),
        SizedBox(height: 10),
        UpdatesStateTitle(title: 'Muted updates'),
        SizedBox(height: 10),
        MutedUpdatesListView(),
      ],
    );
  }
}
