import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';

class TabRound extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> child;
  final EdgeInsetsGeometry? tabPadding;
  final Decoration? tabDecoration;
  final double? contentHeight;
  final Function(int)? onPressTab;

  const TabRound({
    super.key,
    required this.tabs,
    required this.child,
    this.tabPadding,
    this.tabDecoration,
    this.contentHeight,
    this.onPressTab,
  });

  @override
  TabRoundState createState() => TabRoundState();
}

class TabRoundState extends State<TabRound>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      animationDuration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: widget.tabPadding ?? EdgeInsets.all(8),
          decoration:
              widget.tabDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
          child: Row(
            children: [
              for (int i = 0; i < widget.tabs.length; i++) ...[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _tabController.animateTo(i);
                      if (widget.onPressTab != null) {
                        widget.onPressTab!(i);
                      }
                    },
                    child: AnimatedBuilder(
                      animation: _tabController.animation!,
                      builder: (context, child) {
                        double animationValue = _tabController.animation!.value;
                        double difference = (animationValue - i).abs();
                        double opacity = 1.0 - difference.clamp(0.0, 1.0);

                        // Interpolate background color
                        Color backgroundColor = Color.lerp(
                          Colors.transparent,
                          Colors.black,
                          opacity,
                        )!;

                        // Interpolate text color
                        Color textColor = Color.lerp(
                          Theme.of(context).colorScheme.primary,
                          Colors.white,
                          opacity,
                        )!;

                        return Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          child: Center(
                            child: TextView(
                              text: widget.tabs[i],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (i < widget.tabs.length - 1) SizedBox(width: 12),
              ],
            ],
          ),
        ),
        if (widget.contentHeight != null)
          SizedBox(
            width: double.infinity,
            height: widget.contentHeight,
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < widget.child.length; i++) ...[
                  widget.child[i],
                ],
              ],
            ),
          )
        else
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < widget.child.length; i++) ...[
                  widget.child[i],
                ],
              ],
            ),
          ),
      ],
    );
  }
}
