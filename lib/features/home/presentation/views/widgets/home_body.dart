import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return a list view dot builder of chat item like whatsapp
    return ListView.builder(
      itemCount: 100,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/marwan.jpg'),
          ),
          title: Text('Marwan Ali'),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(width: 5),
              Text(
                'This is the last message',
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('12:00 PM'),
              SizedBox(height: 5),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
