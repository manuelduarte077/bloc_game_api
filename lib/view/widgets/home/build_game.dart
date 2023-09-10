import 'package:flutter/material.dart';

import 'package:bloc_api/model/data_model.dart';
import 'package:bloc_api/view/screens/screens.dart';

class BuildGameModel extends StatelessWidget {
  const BuildGameModel({
    Key? key,
    required this.apiResult,
  }) : super(key: key);

  final List<DataModel> apiResult;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (context, index) {
        final DataModel dataModel = apiResult[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(dataModel: dataModel),
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage(dataModel.image),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4),
                          BlendMode.dstIn,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            dataModel.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Platforms: ' + dataModel.platforms,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
