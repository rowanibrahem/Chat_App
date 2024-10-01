import 'package:chatapp_mentor/core/shared_widgets/no_image_circle_avatar.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/home/data/chat_api_services/chat_api_services.dart';
import 'package:chatapp_mentor/features/home/presentation/views/conversation_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/group_conversation_view%20.dart';
import 'package:chatapp_mentor/features/home/presentation/views/new_group_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_chat_shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GroupsViewBody extends StatelessWidget {
  const GroupsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('groups').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ChatsShimmer();
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text('No Groups found, Try add a group'));
            }

            var groups = snapshot.data!.docs;

            return ListView.builder(
              itemCount: groups.length - 1,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var group = groups[index].data() as Map<String, dynamic>;
                String groupId = group['groupId'] ?? 'No group Id';
                String groupName = group['groupName'] ?? 'No group name';
                List<dynamic> groupParticipants =
                    group['participants'] ?? 'No Group Participants';
                bool isCurrentEmailParticipant =
                    groupParticipants.contains(currentEmail);
                if (isCurrentEmailParticipant == true) {
                  return const SizedBox.shrink();
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GroupConversationView(
                          groupId: groupId,
                          groupName: groupName,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const NoImageCircleAvatar(isGroup: true),
                    title: Text(groupName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.group,
                            color: Colors.blueGrey, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          groupParticipants[index],
                          style: const TextStyle(color: Colors.blueGrey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewGroupView(),
                  ));
            },
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
