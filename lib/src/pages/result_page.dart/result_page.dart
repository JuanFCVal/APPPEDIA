import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/entities_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entitiesProvider = Provider.of<EntitiesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Texto',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  entitiesProvider.searchText,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                entitiesProvider.apiResponseIsLoadig
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Descomposición",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Oraciones en inglés",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ...entitiesProvider.apiResponse.result.idiomResult.en
                              .map((value) => Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ))
                              .toList(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Oraciones después de retirar stopwords",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ...entitiesProvider
                              .apiResponse.result.idiomResult.removedStopWordsEn
                              .map((value) => Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ))
                              .toList(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Oraciones en español",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ...entitiesProvider.apiResponse.result.idiomResult.es
                              .map((value) => Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ))
                              .toList(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Oraciones después de retirar stopwords",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          ...entitiesProvider
                              .apiResponse.result.idiomResult.removedStopWordsEs
                              .map((value) => Text(
                                    value,
                                    style: const TextStyle(color: Colors.white),
                                  ))
                              .toList(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Entidades",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24))
                            ],
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                ...entitiesProvider.entities.resources.map((resource) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 25, sigmaY: 25, tileMode: TileMode.clamp),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 115, 104, 104),
                              borderRadius: BorderRadius.circular(20)),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      resource.surfaceForm,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ...resource.getTypesList().map(
                                  (type) {
                                    return Text(
                                      type,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    );
                                  },
                                ),
                                const Divider(
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.ios_share_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        await launchUrl(resource.getUri());
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
