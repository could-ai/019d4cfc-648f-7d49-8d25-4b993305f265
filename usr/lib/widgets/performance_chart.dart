import 'package:flutter/material.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for 5 years
    final data = [
      {'year': '2019', 'revenue': 4500.0, 'profit': 850.0},
      {'year': '2020', 'revenue': 4800.0, 'profit': 920.0},
      {'year': '2021', 'revenue': 5200.0, 'profit': 1050.0},
      {'year': '2022', 'revenue': 5900.0, 'profit': 1200.0},
      {'year': '2023', 'revenue': 6800.0, 'profit': 1450.0},
    ];

    final maxRevenue = data.map((e) => e['revenue'] as double).reduce((a, b) => a > b ? a : b);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: data.map((item) {
            final revenueHeight = (item['revenue'] as double) / maxRevenue * (constraints.maxHeight - 40);
            final profitHeight = (item['profit'] as double) / maxRevenue * (constraints.maxHeight - 40);

            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Revenue Bar
                    Tooltip(
                      message: 'Revenue: ₹${item['revenue']}',
                      child: Container(
                        width: 24,
                        height: revenueHeight,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade700,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Profit Bar
                    Tooltip(
                      message: 'Profit: ₹${item['profit']}',
                      child: Container(
                        width: 24,
                        height: profitHeight,
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item['year'] as String,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
