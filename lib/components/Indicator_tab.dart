import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';

class IndicatorTab extends StatefulWidget {
  final TabController tabController;
  final List<Widget> child;
  final double currentPage;
  final EdgeInsets padding;
  const IndicatorTab({
    super.key,
    required this.child,
    required this.tabController,
    required this.currentPage,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  });

  @override
  State<IndicatorTab> createState() => _IndicatorTabState();
}

class _IndicatorTabState extends State<IndicatorTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < widget.child.length; i++) ...[
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.tabController.animateTo(i),
                    child: AnimatedBuilder(
                      animation: widget.tabController.animation!,
                      builder: (context, child) {
                        // Calculate opacity based on distance from current page
                        double distance = (widget.currentPage - i).abs();
                        double opacity = (1.0 - distance).clamp(0.0, 1.0);

                        return Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Color.lerp(
                              Colors.grey[300],
                              Theme.of(context).colorScheme.onPrimary,
                              opacity,
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              AnimatedBuilder(
                animation: widget.tabController,
                builder: (context, child) {
                  return TextView(
                    text:
                        '${widget.tabController.index + 1}/${widget.child.length}',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  );
                },
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: widget.tabController,
              children: [
                for (int i = 0; i < widget.child.length; i++) ...[
                  widget.child[i],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
