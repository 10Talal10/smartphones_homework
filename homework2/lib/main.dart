import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://docs.flutter.dev/assets/images/docs/ui/layout/lake.jpg',
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),

          // العنوان + النجمة
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Oeschinen Lake Campground',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Kandersteg, Switzerland',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.star, color: Colors.red),
                const Text('41'),
              ],
            ),
          ),

          // الأزرار
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ButtonColumn(icon: Icons.call, label: 'CALL'),
              ButtonColumn(icon: Icons.near_me, label: 'ROUTE'),
              ButtonColumn(icon: Icons.share, label: 'SHARE'),
            ],
          ),

          // الوصف
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
              'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
              'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
              'and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer.',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonColumn extends StatelessWidget {
  final IconData icon;
  final String label;

  const ButtonColumn({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}