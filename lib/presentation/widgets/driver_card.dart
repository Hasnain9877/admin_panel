import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth;

        if (constraints.maxWidth < 600) {
          // Mobile
          cardWidth = constraints.maxWidth;
        } else if (constraints.maxWidth < 1000) {
          // Tablet
          cardWidth = 600;
        } else {
          // Desktop
          cardWidth = 100;
        }

        return Center(
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 6),

            child: Row(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/100',
                      ),
                      radius: 20,
                    ),
                  ],
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        //  SizedBox(width: 80,),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Available',
                              style: TextStyle(color: Colors.green, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconText(icon: Icons.car_rental, label: 'SUV'),
                          SizedBox(width: 8,),
                          IconText(
                            icon: Icons.location_on_outlined,
                            label: 'DownTown',
                          ),
                          SizedBox(width: 8,),
                          IconText(icon: Icons.star, label: '4.8'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconText({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.amber),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Column(
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// const CircleAvatar(
// backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
// radius: 20,
// ),
//
// ],
// ),
// //const SizedBox(height: 8),
// Row(
// children: [
// const Text(
// 'John Doe',
// style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// ),
// const Spacer(),
// Container(
// padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// decoration: BoxDecoration(
// color: Colors.green.shade100,
// borderRadius: BorderRadius.circular(10),
// ),
// child: const Text(
// 'Available',
// style: TextStyle(color: Colors.green, fontSize: 12),
// ),
// ),
// ],
// ),
// // Info Row
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: const [
// IconText(icon: Icons.car_rental, label: 'SUV'),
// IconText(icon: Icons.location_on_outlined, label: 'DownTown'),
// IconText(icon: Icons.star, label: '4.8'),
// ],
// ),
