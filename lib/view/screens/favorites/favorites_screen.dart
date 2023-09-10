import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const routName = '/favorites';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FavoritesScreen(),
      settings: const RouteSettings(name: routName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(
        10, (i) => 'Mithy (IndieGala) Giveawa GiveawayGiveawayy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://www.gamerpower.com/offers/1/64fb2ac933138.jpg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ends in 2 days',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
