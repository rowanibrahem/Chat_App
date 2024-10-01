import 'package:chatapp_mentor/features/home/presentation/views/group_conversation_view%20.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_app_bar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/positioned_next_arrow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class NewGroupSecondStep extends StatelessWidget {
  const NewGroupSecondStep({super.key, required this.selectedUsers});
  final List<Map<String, dynamic>> selectedUsers;
  @override
  Widget build(BuildContext context) {
    TextEditingController groupNameController = TextEditingController();
    return Scaffold(
      appBar: const NewGroupAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: groupNameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter group name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Text(
                  'Participants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedUsers.length,
                    itemBuilder: (context, index) {
                      var user = selectedUsers[index];
                      String name = user['name'] ?? 'No name';
                      String phone = user['phone'] ?? 'No phone';
                      String email = user['email'] ?? 'No email';
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(name),
                        subtitle: Text(phone),
                        trailing: Text(email),
                      );
                    },
                  ),
                ),
              ],
            ),
            PositionedNextArrow(
              onPressed: () async {
                String groupId = const Uuid().v4();
                await FirebaseFirestore.instance
                    .collection('groups')
                    .doc(groupId)
                    .set({
                  'groupId': groupId,
                  'groupName': groupNameController.text,
                  'participants':
                      selectedUsers.map((user) => user['email']).toList(),
                  'createdAt': DateTime.now(),
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupConversationView(
                      groupId: groupId,
                      groupName: groupNameController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
