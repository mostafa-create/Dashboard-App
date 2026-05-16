import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/dashboard_data.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface, borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.4)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Recent Transactions', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
          TextButton(
            onPressed: () {},
            child: Text('View All', style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w600)),
          ),
        ]),
        const SizedBox(height: 16),
        ...sampleTransactions.map((t) => _buildItem(t)),
      ]),
    );
  }

  Widget _buildItem(TransactionData t) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.3)),
        ),
        child: Row(children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(color: t.avatarColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text(t.avatarLetter, style: TextStyle(color: t.avatarColor, fontWeight: FontWeight.w700, fontSize: 16))),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t.name, style: TextStyle(color: AppColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 2),
            Text(t.description, style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
          ])),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(t.amount, style: TextStyle(color: t.isIncome ? AppColors.success : AppColors.error, fontSize: 14, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(t.date, style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
          ]),
        ]),
      ),
    );
  }
}

class ActivityFeed extends StatelessWidget {
  const ActivityFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface, borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.4)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Recent Activity', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
          Icon(Icons.more_horiz_rounded, color: AppColors.textSecondary),
        ]),
        const SizedBox(height: 16),
        ...sampleActivities.asMap().entries.map((e) => _buildActivity(e.value, e.key < sampleActivities.length - 1)),
      ]),
    );
  }

  Widget _buildActivity(ActivityData a, bool showLine) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        Container(
          width: 38, height: 38,
          decoration: BoxDecoration(color: a.color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
          child: Icon(a.icon, color: a.color, size: 18),
        ),
        if (showLine) Container(width: 2, height: 36, color: AppColors.cardBorder.withValues(alpha: 0.4)),
      ]),
      const SizedBox(width: 14),
      Expanded(child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(a.title, style: TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          Text(a.subtitle, style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
          const SizedBox(height: 4),
          Text(a.time, style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
        ]),
      )),
    ]);
  }
}
