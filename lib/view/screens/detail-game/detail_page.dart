import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bloc_api/model/data_model.dart';
import 'package:bloc_api/view/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final DataModel dataModel;
  const DetailPage({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  launch(dataModel.open_giveaway_url);
                },
                child: Text('GET THE GAME',
                    style: Theme.of(context).textTheme.headline3!),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image(
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(dataModel.image),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                    Text(
                      dataModel.description,
                      style: const TextStyle(),
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
                      style: const TextStyle(
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Widgets de los botones para ver mas detalle del videojuego
                    ActionsButton(dataModel: dataModel),
                  ],
                ),
              ),
            ],
          ),
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
