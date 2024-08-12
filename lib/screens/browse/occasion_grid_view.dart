import 'package:flutter/material.dart';
import 'package:unearthed/screens/browse/occasion_grid_tile.dart';
import 'package:unearthed/screens/browse/occasion_items.dart';

class OccasionGridView extends StatelessWidget {
  OccasionGridView({super.key});

  final List occasions = ['Wedding Guest', 'Party', 'Elevated Daytime', 'Date Night', 'Work'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          padding: const EdgeInsets.all(4.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
          itemCount: occasions.length, // <-- required
          itemBuilder: (_, i) => 
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => (OccasionItems(occasions[i].toLowerCase()))));
                },
                child: Container(
                  // decoration: BoxDecoration(
                    // border: Border.all(color: Colors.blueAccent)
                  // ),
                  margin: const EdgeInsets.all(10),
                  // color: Colors.white,
                  // child: Text('TEST')
                  child: Column(
                    children: [
                      OccasionGridTile(occasions[i].toLowerCase()),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(occasions[i], style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}