import 'package:ard_light/components/bottom_sheet.dart';
import 'package:ard_light/components/touchable_opacity.dart';
import 'package:ard_light/features/auth/presentation/widget/language_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageChange extends StatelessWidget {
  final bool? isHasBorder;
  final bool? isHasMarginRight;
  const LanguageChange({Key? key, this.isHasBorder, this.isHasMarginRight})
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
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1,
                  )
                : null,
          ),
          child: SvgPicture.asset(
            'assets/icons/globe.svg',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
      ),
      onTap: () async {
        await CustomBottomSheet.show(context: context, child: LanguageWidget());
      },
    );
  }
}
