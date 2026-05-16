import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Sidebar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      width: _isCollapsed ? 80 : 260,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          right: BorderSide(
            color: AppColors.cardBorder.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Logo area
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(
              horizontal: _isCollapsed ? 16 : 24,
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.dashboard_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                if (!_isCollapsed) ...[
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                _buildNavSection('MAIN'),
                _buildNavItem(0, Icons.grid_view_rounded, 'Overview'),
                _buildNavItem(1, Icons.analytics_rounded, 'Analytics'),
                _buildNavItem(2, Icons.shopping_bag_rounded, 'Orders'),
                const SizedBox(height: 20),
                _buildNavSection('MANAGEMENT'),
                _buildNavItem(3, Icons.people_alt_rounded, 'Customers'),
                _buildNavItem(4, Icons.inventory_2_rounded, 'Products'),
                _buildNavItem(5, Icons.receipt_long_rounded, 'Invoices'),
                const SizedBox(height: 20),
                _buildNavSection('OTHER'),
                _buildNavItem(6, Icons.settings_rounded, 'Settings'),
                _buildNavItem(7, Icons.help_outline_rounded, 'Help Center'),
              ],
            ),
          ),

          // Collapse button
          Container(
            padding: const EdgeInsets.all(12),
            child: InkWell(
              onTap: () => setState(() => _isCollapsed = !_isCollapsed),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _isCollapsed
                      ? Icons.chevron_right_rounded
                      : Icons.chevron_left_rounded,
                  color: AppColors.textSecondary,
                  size: 22,
                ),
              ),
            ),
          ),

          // User profile
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: _isCollapsed ? 16 : 20,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.cardBorder.withValues(alpha: 0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppColors.accentGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'K',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                if (!_isCollapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin User',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'admin@dashboard.io',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavSection(String title) {
    if (_isCollapsed) return const SizedBox(height: 16);
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8, top: 4),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textMuted,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = widget.selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onItemSelected(index),
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 46,
            padding: EdgeInsets.symmetric(
              horizontal: _isCollapsed ? 0 : 14,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.3)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              mainAxisAlignment: _isCollapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: 20,
                ),
                if (!_isCollapsed) ...[
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
