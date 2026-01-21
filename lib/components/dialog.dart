import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Function()? onComplete;
  final VoidCallback? onCancel;
  final bool isDismissible;
  final String? navigation;
  final Widget? buttonView;
  final String? buttonTitle;
  final String? type;
  const CustomDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.onComplete,
    this.onCancel,
    this.isDismissible = true,
    this.navigation,
    this.buttonView,
    this.buttonTitle,
    this.type,
  });

  static Future<void> success(
    BuildContext context, {
    String? title,
    String? subtitle,
    bool isDismissible = true,
    String? navigation,
    Widget? buttonView,
    String? buttonTitle,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => CustomDialog(
        title: title ?? "",
        subtitle: subtitle,
        isDismissible: isDismissible,
        buttonView: buttonView,
        buttonTitle: buttonTitle,
        type: "success",
        onComplete: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
        onCancel: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
      ),
    );
  }

  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? subtitle,
    bool isDismissible = true,
    String? navigation,
    Widget? buttonView,
    String? buttonTitle,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => CustomDialog(
        title: title ?? "",
        subtitle: subtitle,
        isDismissible: isDismissible,
        buttonView: buttonView,
        buttonTitle: buttonTitle,
        type: "alert",
        onComplete: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
        onCancel: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
      ),
    );
  }

  static Future<void> error(
    BuildContext context, {
    String? title,
    String? subtitle,
    bool isDismissible = true,
    String? navigation,
    Widget? buttonView,
    String? buttonTitle,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) => CustomDialog(
        title: title ?? "",
        subtitle: subtitle,
        isDismissible: isDismissible,
        buttonView: buttonView,
        buttonTitle: buttonTitle,
        type: "error",
        onComplete: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
        onCancel: () {
          Navigator.pop(context);
          if (navigation != null) {
            GoRouter.of(context).go(navigation);
          }
        },
      ),
    );
  }

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  if (widget.type == "success")
                    SvgPicture.asset(
                      'assets/icons/Success.svg',
                      width: 150,
                      height: 150,
                    ),
                  if (widget.type == "error")
                    SvgPicture.asset(
                      'assets/icons/Failed.svg',
                      width: 150,
                      height: 150,
                    ),
                  if (widget.type == "alert")
                    SvgPicture.asset(
                      'assets/icons/Warning.svg',
                      width: 150,
                      height: 150,
                    ),
                  const SizedBox(height: 15),
                  TextView(
                    text: widget.title,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 15),
                  if (widget.subtitle != null && widget.subtitle!.isNotEmpty)
                    TextView(
                      text: widget.subtitle!,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
            Divider(color: Theme.of(context).colorScheme.onSurface),
            if (widget.buttonView != null)
              widget.buttonView!
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: Button(
                  onTap: () {
                    widget.onComplete?.call();
                  },
                  text:
                      widget.buttonTitle ??
                      AppLocalizations.of(context)!.buttonUnderstand,
                  color: Theme.of(context).colorScheme.primary,
                  titleColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
