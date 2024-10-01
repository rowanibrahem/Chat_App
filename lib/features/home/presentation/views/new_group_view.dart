import 'package:chatapp_mentor/core/Routing/routes.dart';
import 'package:chatapp_mentor/core/shared_widgets/no_image_circle_avatar.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_app_bar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_second_step.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/positioned_next_arrow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewGroupView extends StatefulWidget {
  const NewGroupView({super.key});

  @override
  State<NewGroupView> createState() => _NewGroupViewState();
}

class _NewGroupViewState extends State<NewGroupView> {
  List<Map<String, dynamic>> selectedUsers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewGroupAppBar(),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No users found'));
              }

              var users = snapshot.data!.docs;

              return ListView.builder(
                itemCount: users.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var user = users[index].data() as Map<String, dynamic>;
                  String name = user['name'] ?? 'No name';
                  String phone = user['phone'] ?? 'No phone';
                  String email = user['email'] ?? 'No email';
                  if (email == currentEmail) {
                    return const SizedBox();
                  }
                  bool isSelected = selectedUsers
                      .any((selectedUser) => selectedUser['email'] == email);
                  return InkWell(
                    onTap: () {
                      if (isSelected) {
                        selectedUsers.removeWhere(
                            (selectedUser) => selectedUser['email'] == email);
                      } else {
                        selectedUsers.add(user);
                      }
                      setState(() {});
                    },
                    child: ListTile(
                      leading: const NoImageCircleAvatar(),
                      title: Text(name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.numbers,
                              color: Colors.blueGrey, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            phone,
                            style: const TextStyle(color: Colors.blueGrey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_box,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                            ),
                    ),
                  );
                },
              );
            },
          ),
          PositionedNextArrow(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NewGroupSecondStep(
                    selectedUsers: selectedUsers,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
