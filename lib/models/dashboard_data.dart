import 'package:flutter/material.dart';

class StatCardData {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final IconData icon;
  final List<Color> gradientColors;

  const StatCardData({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
    required this.gradientColors,
  });
}

class TransactionData {
  final String name;
  final String description;
  final String amount;
  final String date;
  final bool isIncome;
  final String avatarLetter;
  final Color avatarColor;

  const TransactionData({
    required this.name,
    required this.description,
    required this.amount,
    required this.date,
    required this.isIncome,
    required this.avatarLetter,
    required this.avatarColor,
  });
}

class ActivityData {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;
  final Color color;

  const ActivityData({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
    required this.color,
  });
}

// Sample data
final List<StatCardData> sampleStats = [
  StatCardData(
    title: 'Total Revenue',
    value: '\$48,294',
    change: '+12.5%',
    isPositive: true,
    icon: Icons.attach_money_rounded,
    gradientColors: [const Color(0xFF6C63FF), const Color(0xFF00D9FF)],
  ),
  StatCardData(
    title: 'Active Users',
    value: '3,842',
    change: '+8.2%',
    isPositive: true,
    icon: Icons.people_alt_rounded,
    gradientColors: [const Color(0xFF00E5A0), const Color(0xFF00D9FF)],
  ),
  StatCardData(
    title: 'New Orders',
    value: '1,253',
    change: '-3.1%',
    isPositive: false,
    icon: Icons.shopping_bag_rounded,
    gradientColors: [const Color(0xFFFF6B9D), const Color(0xFFFF8E53)],
  ),
  StatCardData(
    title: 'Conversion',
    value: '24.8%',
    change: '+4.7%',
    isPositive: true,
    icon: Icons.trending_up_rounded,
    gradientColors: [const Color(0xFFFFB946), const Color(0xFFFF6B9D)],
  ),
];

final List<TransactionData> sampleTransactions = [
  TransactionData(
    name: 'Sarah Johnson',
    description: 'Premium subscription',
    amount: '+\$299.00',
    date: 'Today',
    isIncome: true,
    avatarLetter: 'S',
    avatarColor: const Color(0xFF6C63FF),
  ),
  TransactionData(
    name: 'Mike Peters',
    description: 'Product purchase',
    amount: '+\$149.50',
    date: 'Today',
    isIncome: true,
    avatarLetter: 'M',
    avatarColor: const Color(0xFF00E5A0),
  ),
  TransactionData(
    name: 'Server Costs',
    description: 'AWS monthly bill',
    amount: '-\$432.00',
    date: 'Yesterday',
    isIncome: false,
    avatarLetter: 'A',
    avatarColor: const Color(0xFFFF5B5B),
  ),
  TransactionData(
    name: 'Emily Davis',
    description: 'Enterprise plan',
    amount: '+\$899.00',
    date: 'Yesterday',
    isIncome: true,
    avatarLetter: 'E',
    avatarColor: const Color(0xFF00D9FF),
  ),
  TransactionData(
    name: 'Marketing Ads',
    description: 'Google Ads campaign',
    amount: '-\$250.00',
    date: '2 days ago',
    isIncome: false,
    avatarLetter: 'G',
    avatarColor: const Color(0xFFFFB946),
  ),
];

final List<ActivityData> sampleActivities = [
  ActivityData(
    title: 'New user registered',
    subtitle: 'john.doe@email.com joined the platform',
    time: '2 min ago',
    icon: Icons.person_add_rounded,
    color: const Color(0xFF6C63FF),
  ),
  ActivityData(
    title: 'Order completed',
    subtitle: 'Order #12847 has been delivered',
    time: '15 min ago',
    icon: Icons.check_circle_rounded,
    color: const Color(0xFF00E5A0),
  ),
  ActivityData(
    title: 'Payment received',
    subtitle: '\$1,250.00 from Enterprise client',
    time: '1 hr ago',
    icon: Icons.payment_rounded,
    color: const Color(0xFF00D9FF),
  ),
  ActivityData(
    title: 'Server alert',
    subtitle: 'CPU usage peaked at 89%',
    time: '2 hr ago',
    icon: Icons.warning_rounded,
    color: const Color(0xFFFFB946),
  ),
  ActivityData(
    title: 'New review',
    subtitle: '5-star review from premium user',
    time: '3 hr ago',
    icon: Icons.star_rounded,
    color: const Color(0xFFFF6B9D),
  ),
];
