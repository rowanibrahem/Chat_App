import 'package:chatapp_mentor/features/home/presentation/views/widgets/new_group_app_bar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/positioned_next_arrow.dart';
import 'package:flutter/material.dart';

class NewGroupSecondStep extends StatelessWidget {
  const NewGroupSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
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
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Stack(children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/marwan.jpg'),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 15,
                            child: InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    },
                  ),
                ),
              ],
            ),
            PositionedNextArrow(
              onPressed: () {
                // navigate to the group chat screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
