import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_colors.dart';

class RevenueChart extends StatefulWidget {
  const RevenueChart({super.key});
  @override
  State<RevenueChart> createState() => _RevenueChartState();
}

class _RevenueChartState extends State<RevenueChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;
  late Animation<double> _anim;
  int _selectedPeriod = 0;
  final List<String> _periods = ['7D', '1M', '3M', '1Y'];

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      duration: const Duration(milliseconds: 1200), vsync: this);
    _anim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOutCubic);
    _animCtrl.forward();
  }

  @override
  void dispose() { _animCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.4)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Revenue Overview', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('Monthly revenue performance', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ]),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: AppColors.surfaceLight, borderRadius: BorderRadius.circular(12)),
                child: Row(children: List.generate(_periods.length, (i) {
                  final sel = _selectedPeriod == i;
                  return GestureDetector(
                    onTap: () { setState(() => _selectedPeriod = i); _animCtrl.reset(); _animCtrl.forward(); },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(color: sel ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(8)),
                      child: Text(_periods[i], style: TextStyle(color: sel ? Colors.white : AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  );
                })),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 220,
            child: AnimatedBuilder(animation: _anim, builder: (ctx, _) {
              return LineChart(LineChartData(
                gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 10,
                  getDrawingHorizontalLine: (v) => FlLine(color: AppColors.cardBorder.withValues(alpha: 0.3), strokeWidth: 1)),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 42, interval: 10,
                    getTitlesWidget: (v, m) => Text('\$${v.toInt()}k', style: TextStyle(color: AppColors.textMuted, fontSize: 11)))),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 32, interval: 1,
                    getTitlesWidget: (v, m) {
                      const l = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
                      return v.toInt() >= 0 && v.toInt() < l.length
                        ? Padding(padding: const EdgeInsets.only(top: 8), child: Text(l[v.toInt()], style: TextStyle(color: AppColors.textMuted, fontSize: 11)))
                        : const SizedBox.shrink();
                    })),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minX: 0, maxX: 6, minY: 0, maxY: 50,
                lineBarsData: [
                  LineChartBarData(
                    spots: [FlSpot(0,18),FlSpot(1,28),FlSpot(2,22),FlSpot(3,35),FlSpot(4,30),FlSpot(5,42),FlSpot(6,38)].map((s) => FlSpot(s.x, s.y * _anim.value)).toList(),
                    isCurved: true, curveSmoothness: 0.35, gradient: AppColors.primaryGradient, barWidth: 3, isStrokeCapRound: true,
                    dotData: FlDotData(show: true, getDotPainter: (s,p,b,i) => FlDotCirclePainter(radius: 4, color: AppColors.primary, strokeWidth: 2, strokeColor: Colors.white)),
                    belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: [AppColors.primary.withValues(alpha: 0.25), AppColors.primary.withValues(alpha: 0.0)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  ),
                  LineChartBarData(
                    spots: [FlSpot(0,12),FlSpot(1,20),FlSpot(2,16),FlSpot(3,25),FlSpot(4,22),FlSpot(5,30),FlSpot(6,28)].map((s) => FlSpot(s.x, s.y * _anim.value)).toList(),
                    isCurved: true, curveSmoothness: 0.35, color: AppColors.textMuted.withValues(alpha: 0.4), barWidth: 2, isStrokeCapRound: true,
                    dotData: const FlDotData(show: false), dashArray: [5, 5],
                  ),
                ],
                lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (s) => AppColors.surfaceLight, tooltipRoundedRadius: 12,
                  tooltipPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  getTooltipItems: (spots) => spots.map((s) => LineTooltipItem('\$${s.y.toStringAsFixed(1)}k',
                    TextStyle(color: s.bar.gradient != null ? AppColors.primary : AppColors.textSecondary, fontWeight: FontWeight.w600, fontSize: 13))).toList(),
                )),
              ));
            }),
          ),
        ],
      ),
    );
  }
}

class TrafficDonutChart extends StatelessWidget {
  const TrafficDonutChart({super.key});

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
        Text('Traffic Sources', style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text('Where visitors come from', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        const SizedBox(height: 24),
        SizedBox(height: 180, child: PieChart(PieChartData(sectionsSpace: 3, centerSpaceRadius: 45, sections: [
          PieChartSectionData(value: 40, color: AppColors.primary, radius: 35, title: '40%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          PieChartSectionData(value: 25, color: AppColors.secondary, radius: 35, title: '25%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          PieChartSectionData(value: 20, color: AppColors.accent, radius: 35, title: '20%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          PieChartSectionData(value: 15, color: AppColors.warning, radius: 35, title: '15%', titleStyle: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
        ]))),
        const SizedBox(height: 20),
        _legend('Direct', AppColors.primary, '40%'),
        const SizedBox(height: 10),
        _legend('Organic Search', AppColors.secondary, '25%'),
        const SizedBox(height: 10),
        _legend('Social Media', AppColors.accent, '20%'),
        const SizedBox(height: 10),
        _legend('Referral', AppColors.warning, '15%'),
      ]),
    );
  }

  Widget _legend(String label, Color color, String value) {
    return Row(children: [
      Container(width: 10, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
      const SizedBox(width: 10),
      Expanded(child: Text(label, style: TextStyle(color: AppColors.textSecondary, fontSize: 13))),
      Text(value, style: TextStyle(color: AppColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
    ]);
  }
}
