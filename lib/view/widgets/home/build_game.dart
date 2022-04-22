import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (context, index) {
        final DataModel dataModel = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 8.0,
          ),
          child: InkWell(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: 230,
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.cover,
                      image: NetworkImage(dataModel.image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width / 1.05,
                      height: 120,
                      border: 0,
                      borderRadius: 0,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xffFFFFFF).withOpacity(0.1),
                          const Color(0xffFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xffFFFFFF).withOpacity(0.5),
                          const Color(0xffFFFFFF).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                dataModel.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Platforms: ' + dataModel.platforms,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
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
