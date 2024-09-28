import 'package:chatapp_mentor/core/shared_widgets/no_image_circle_avatar.dart';
import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/views/chat_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/home_chat_shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const HomeChatShimmer();
            }

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

                return InkWell(
                  onTap: () {
                    String chatId = generateChatIdForUsers(currentEmail, email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationView(
                          chatId:chatId,
                          email: email,
                          name: name,
                          phone: phone,
                        ),
                      ),
                    );
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
                    trailing: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('12:00 PM'),
                        SizedBox(height: 5),
                        Expanded(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            child: Center(
                              child: Text(
                                '2',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
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
            onPressed: () {},
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
  
  String generateChatIdForUsers(String email1, String email2) {
  // Sort emails to ensure consistent ordering for the chat ID
  List<String> emails = [email1, email2];
  emails.sort();

  // Combine the sorted emails to create a unique chat ID
  return emails.join('_');
}

}
