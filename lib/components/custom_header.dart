import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isBack;
  final List<Widget>? rightWidgets;
  const CustomHeader({super.key, this.title, this.isBack, this.rightWidgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: isBack == true
          ? Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1,
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(
                    'assets/icons/arrow-left.svg',
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    } else {
                      GoRouter.of(context).go('/');
                    }
                  },
                ),
              ),
            )
          : null,
      title: TextView(
        text: title ?? "",
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      actions: rightWidgets != null ? [Row(children: rightWidgets!)] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
