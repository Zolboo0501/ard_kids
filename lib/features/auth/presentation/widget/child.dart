import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/components/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Child extends StatelessWidget {
  final dynamic data;
  const Child({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        GoRouter.of(context).go('/auth/registerChildrenStep');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: data['gender'] == 1
                ? SvgPicture.asset("assets/icons/male.svg")
                : SvgPicture.asset("assets/icons/woman.svg"),
          ),
          title: TextView(text: data["name"], fontWeight: FontWeight.w600),

          subtitle: Row(
            children: [
              TextView(text: data["register"], fontSize: 14),
              SizedBox(width: 10),
              TextView(text: "${data["age"]} нас", fontSize: 14),
            ],
          ),
          trailing: Icon(Icons.chevron_right, size: 24),
        ),
      ),
    );
  }
}
