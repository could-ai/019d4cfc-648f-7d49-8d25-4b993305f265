import 'package:flutter/material.dart';

class InsightsList extends StatelessWidget {
  const InsightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Major Challenges'),
              Tab(text: 'Recommendations'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildChallengesList(),
                _buildRecommendationsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesList() {
    final challenges = [
      {
        'title': 'Rapid Capacity Growth',
        'desc': 'Managing rapid growth in transmission capacity and coverage while maintaining system reliability and efficiency.',
        'icon': Icons.trending_up,
      },
      {
        'title': 'Regulatory Compliance',
        'desc': 'Ensuring compliance with evolving technical and safety standards (CEA, BIS, IEGC).',
        'icon': Icons.rule,
      },
      {
        'title': 'Transmission Losses',
        'desc': 'Addressing transmission losses and congestion in the grid, which directly impacts profitability.',
        'icon': Icons.trending_down,
      },
      {
        'title': 'Renewable Integration',
        'desc': 'Integrating intermittent renewable energy sources with grid stability.',
        'icon': Icons.solar_power,
      },
      {
        'title': 'Aging Infrastructure',
        'desc': 'Maintaining and upgrading aging infrastructure to prevent outages and safety hazards.',
        'icon': Icons.construction,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: challenges.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red.shade50,
            child: Icon(challenges[index]['icon'] as IconData, color: Colors.red.shade700),
          ),
          title: Text(challenges[index]['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(challenges[index]['desc'] as String),
          ),
        );
      },
    );
  }

  Widget _buildRecommendationsList() {
    final recommendations = [
      {
        'title': 'Modernization & Digitalization',
        'desc': 'Invest in digital substations and smart grid technologies to improve monitoring and reduce outages.',
        'icon': Icons.memory,
      },
      {
        'title': 'Advanced Grid Integration',
        'desc': 'Enhance grid integration capabilities for renewable energy through advanced planning and technology adoption.',
        'icon': Icons.hub,
      },
      {
        'title': 'Optimize Tower Design',
        'desc': 'Optimize transmission tower design and materials (following IS 802) to reduce costs and improve durability.',
        'icon': Icons.architecture,
      },
      {
        'title': 'Loss Reduction Programs',
        'desc': 'Implement robust loss reduction programs and congestion management using HVDC links.',
        'icon': Icons.speed,
      },
      {
        'title': 'Regulatory Collaboration',
        'desc': 'Foster collaboration with regulatory bodies (CERC/SERC) for transparent performance reporting and tariff adjustments.',
        'icon': Icons.handshake,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: recommendations.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade50,
            child: Icon(recommendations[index]['icon'] as IconData, color: Colors.green.shade700),
          ),
          title: Text(recommendations[index]['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(recommendations[index]['desc'] as String),
          ),
        );
      },
    );
  }
}
