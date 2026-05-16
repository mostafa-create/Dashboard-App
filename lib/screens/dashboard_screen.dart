import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/dashboard_data.dart';
import '../widgets/sidebar.dart';
import '../widgets/stat_card.dart';
import '../widgets/charts.dart';
import '../widgets/data_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedIndex: _selectedNavIndex,
            onItemSelected: (i) => setState(() => _selectedNavIndex = i),
          ),
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          _buildTopBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome section
                  Text('Welcome back, Admin 👋',
                    style: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
                  const SizedBox(height: 4),
                  Text("Here's what's happening with your business today.",
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 15)),
                  const SizedBox(height: 28),

                  // Stat cards
                  LayoutBuilder(builder: (ctx, constraints) {
                    final crossCount = constraints.maxWidth > 1100 ? 4 : constraints.maxWidth > 700 ? 2 : 1;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.55,
                      ),
                      itemCount: sampleStats.length,
                      itemBuilder: (ctx, i) => StatCard(data: sampleStats[i], index: i),
                    );
                  }),
                  const SizedBox(height: 28),

                  // Charts row
                  LayoutBuilder(builder: (ctx, constraints) {
                    if (constraints.maxWidth > 900) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: const RevenueChart()),
                          const SizedBox(width: 20),
                          Expanded(flex: 2, child: const TrafficDonutChart()),
                        ],
                      );
                    }
                    return Column(children: [
                      const RevenueChart(),
                      const SizedBox(height: 20),
                      const TrafficDonutChart(),
                    ]);
                  }),
                  const SizedBox(height: 28),

                  // Bottom row: Transactions + Activity
                  LayoutBuilder(builder: (ctx, constraints) {
                    if (constraints.maxWidth > 900) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: const TransactionsList()),
                          const SizedBox(width: 20),
                          Expanded(child: const ActivityFeed()),
                        ],
                      );
                    }
                    return Column(children: [
                      const TransactionsList(),
                      const SizedBox(height: 20),
                      const ActivityFeed(),
                    ]);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.cardBorder.withValues(alpha: 0.4))),
      ),
      child: Row(children: [
        // Search bar
        Expanded(
          child: Container(
            height: 42,
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.4)),
            ),
            child: Row(children: [
              const SizedBox(width: 14),
              Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
              const SizedBox(width: 10),
              Expanded(child: TextField(
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Search anything...',
                  hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              )),
            ]),
          ),
        ),
        const Spacer(),
        // Notification bell
        _topBarIcon(Icons.notifications_none_rounded, badge: true),
        const SizedBox(width: 8),
        _topBarIcon(Icons.mail_outline_rounded, badge: false),
        const SizedBox(width: 8),
        _topBarIcon(Icons.dark_mode_outlined, badge: false),
      ]),
    );
  }

  Widget _topBarIcon(IconData icon, {bool badge = false}) {
    return Stack(children: [
      Container(
        width: 40, height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceLight.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.3)),
        ),
        child: Icon(icon, color: AppColors.textSecondary, size: 20),
      ),
      if (badge)
        Positioned(top: 8, right: 10,
          child: Container(width: 8, height: 8,
            decoration: BoxDecoration(color: AppColors.accent, shape: BoxShape.circle,
              border: Border.all(color: AppColors.surface, width: 1.5)),
          ),
        ),
    ]);
  }
}
