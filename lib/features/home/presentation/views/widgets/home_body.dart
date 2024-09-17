import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        itemCount: 100,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/marwan.jpg'),
            ),
            title: Text('Marwan Ali',
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Icon(Icons.done_all, color: Colors.blueGrey, size: 20),
                SizedBox(width: 5),
                Text(
                  'This is the last message',
                  style: TextStyle(color: Colors.blueGrey),
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
                Expanded(
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Center(
                      child: Text(
                        '2',
                        maxLines: 1,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
    ]);
  }
}
