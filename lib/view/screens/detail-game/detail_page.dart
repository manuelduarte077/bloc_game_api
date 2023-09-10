import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bloc_api/model/data_model.dart';

class DetailPage extends StatelessWidget {
  final DataModel dataModel;

  const DetailPage({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(dataModel.gamerpower_url);
    final Uri _openUrl = Uri.parse(dataModel.open_giveaway_url);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => launchUrl(_url),
            icon: const Icon(Icons.open_in_new),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(_openUrl);
                },
                child: Text(
                  'GET THE GAME',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ContentDetail(
        dataModel: dataModel,
      ),
    );
  }
}

class ContentDetail extends StatelessWidget {
  const ContentDetail({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image(
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(dataModel.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  TopScreenDetail(dataModel: dataModel),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Game Description',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    dataModel.description,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Steps to get it',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    dataModel.instructions,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Platforms',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    dataModel.platforms,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopScreenDetail extends StatelessWidget {
  const TopScreenDetail({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            dataModel.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        if (dataModel.worth == "N/A")
          const SizedBox(
            height: 12,
          ),
        if (dataModel.worth != "N/A")
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              dataModel.worth,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
