import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBack;
  const CustomHeader({super.key, required this.title, this.isBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isBack == true
          ? IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 32,
              ),
              onPressed: () {
                if (GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                } else {
                  GoRouter.of(context).go('/');
                }
              },
            )
          : null,
      title: TextView(
        text: title,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
