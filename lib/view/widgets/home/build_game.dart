import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:bloc_api/model/data_model.dart';
import 'package:bloc_api/view/screens/screens.dart';
import 'package:bloc_api/view/widgets/widgets.dart';

class BuildGameModel extends StatelessWidget {
  const BuildGameModel({
    Key? key,
    required this.apiResult,
  }) : super(key: key);

  final List<DataModel> apiResult;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: ListView.builder(
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
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            height: 250,
                            width: MediaQuery.of(context).size.width / 1.05,
                            fit: BoxFit.cover,
                            image: NetworkImage(dataModel.image),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: GlassmorphicContainer(
                            width: MediaQuery.of(context).size.width / 1.05,
                            height: 100,
                            border: 0,
                            borderRadius: 0,
                            blur: 25,
                            alignment: Alignment.bottomCenter,
                            linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xffFFFFFF).withOpacity(1.0),
                                const Color(0xffFFFFFF).withOpacity(0.1),
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
                                const Color(0xffFFFFFF).withOpacity(0.1),
                                const Color(0xffFFFFFF).withOpacity(0.1),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
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
                                      color: Colors.black,
                                    ),
                                    softWrap: true,
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
          ),
        ),
      ),
    );
  }
}
