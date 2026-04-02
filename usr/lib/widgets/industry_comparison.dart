import 'package:flutter/material.dart';

class IndustryComparison extends StatelessWidget {
  const IndustryComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildComparisonCard(
          context,
          title: 'Network Availability',
          companyValue: '99.2%',
          industryStandard: '> 99.0%',
          description: 'Regulated by CERC and SERC standards of performance. High availability is critical for grid stability.',
          isPositive: true,
          icon: Icons.network_check,
        ),
        const SizedBox(height: 16),
        _buildComparisonCard(
          context,
          title: 'Transmission Losses',
          companyValue: '3.4%',
          industryStandard: '< 3.0%',
          description: 'Losses during transmission. Needs optimization through advanced HVDC links and better conductor materials.',
          isPositive: false,
          icon: Icons.electric_bolt,
        ),
        const SizedBox(height: 16),
        _buildComparisonCard(
          context,
          title: 'Equipment Compliance',
          companyValue: 'Level 2 BIS',
          industryStandard: 'Level 1 / Level 2 BIS',
          description: 'Adherence to IS 1180 for transformers and IS 802/5613 for transmission towers.',
          isPositive: true,
          icon: Icons.verified_user,
        ),
      ],
    );
  }

  Widget _buildComparisonCard(
    BuildContext context, {
    required String title,
    required String companyValue,
    required String industryStandard,
    required String description,
    required bool isPositive,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Company Metric', style: TextStyle(color: Colors.black54, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      companyValue,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isPositive ? Colors.green.shade700 : Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Industry Standard', style: TextStyle(color: Colors.black54, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      industryStandard,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 32),
            Text(
              description,
              style: const TextStyle(color: Colors.black87, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
