import 'package:chatapp_mentor/features/home/presentation/views/new_group_view.dart';
import 'package:chatapp_mentor/features/home/presentation/views/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      title: const Text(
        'WhatsUp',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        PopupMenuButton<String>(
          elevation: 0,
          position: PopupMenuPosition.under,
          onSelected: (String value) {
            if (kDebugMode) {
              print(value);
            }
          },
          constraints: const BoxConstraints(
            minWidth: 200,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'New Group',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NewGroupView(),
                  ));
                },
                child: const Text('New Group',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              PopupMenuItem<String>(
                value: 'Profile',
                child: const Text('Profile',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ));
                },
              ),
            ];
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
