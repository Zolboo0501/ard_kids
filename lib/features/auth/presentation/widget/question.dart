import 'package:ard_light/components/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Question extends StatelessWidget {
  final bool? isHasBorder;
  final bool? isHasMarginRight;
  const Question({Key? key, this.isHasBorder, this.isHasMarginRight})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 48,
          height: 48,
          margin: EdgeInsets.only(right: isHasMarginRight == true ? 15 : 0),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isHasBorder == true
                ? null
                : Theme.of(context).colorScheme.primary,
            border: isHasBorder == true
                ? Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 1,
                  )
                : null,
          ),
          child: SvgPicture.asset(
            'assets/icons/question.svg',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
      onTap: () {
        GoRouter.of(context).push('/auth/question');
      },
    );
  }
}
