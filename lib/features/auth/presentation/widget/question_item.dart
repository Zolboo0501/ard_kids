import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/components/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionItem extends StatefulWidget {
  final dynamic data;
  QuestionItem({Key? key, this.data}) : super(key: key);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: TextView(text: widget.data["title"])),
                  const SizedBox(width: 12),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: animation,
                          child: child,
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      isExpanded
                          ? 'assets/icons/minus-circle.svg'
                          : 'assets/icons/plus-circle.svg',
                      key: ValueKey<bool>(isExpanded),
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 12,
                          left: 12,
                        ),
                        child: TextView(
                          text: widget.data["description"],
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
