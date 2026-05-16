import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/dashboard_data.dart';

class StatCard extends StatefulWidget {
  final StatCardData data;
  final int index;

  const StatCard({super.key, required this.data, required this.index});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? widget.data.gradientColors[0].withValues(alpha: 0.4)
                  : AppColors.cardBorder.withValues(alpha: 0.4),
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.data.gradientColors[0]
                          .withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon container
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: widget.data.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: widget.data.gradientColors[0]
                              .withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      widget.data.icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  // Change badge
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: widget.data.isPositive
                          ? AppColors.success.withValues(alpha: 0.12)
                          : AppColors.error.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: widget.data.isPositive
                            ? AppColors.success.withValues(alpha: 0.3)
                            : AppColors.error.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.data.isPositive
                              ? Icons.trending_up_rounded
                              : Icons.trending_down_rounded,
                          color: widget.data.isPositive
                              ? AppColors.success
                              : AppColors.error,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.data.change,
                          style: TextStyle(
                            color: widget.data.isPositive
                                ? AppColors.success
                                : AppColors.error,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                widget.data.title,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.data.value,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
