import 'package:bloc_api/model/data_model.dart';
import 'package:bloc_api/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final DataModel dataModel;
  const DetailPage({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/favorites');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Icon(Icons.favorite_sharp),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Game Description",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dataModel.description,
                      style: const TextStyle(),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Steps to get it",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      dataModel.instructions,
                      style: const TextStyle(
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
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
