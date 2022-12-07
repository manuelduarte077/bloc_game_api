import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final tap;

  const CustomAppBar({
    Key? key,
    this.title,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      elevation: 0,
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(
          title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.pushNamed(context, '/favorites');
          },
        ),
        if (title == 'Game Detail')
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: tap,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
