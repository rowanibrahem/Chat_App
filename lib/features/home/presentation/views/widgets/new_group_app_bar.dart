import 'package:flutter/material.dart';

class NewGroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewGroupAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'New Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: Colors.green),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.search,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
