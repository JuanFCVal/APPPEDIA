import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/entities_provider.dart';
import '../../styles/buttons.dart';
import 'widgets/background.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundConts(),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: FormBody(),
            ),
          )
        ],
      ),
    );
  }
}

class FormBody extends StatefulWidget {
  const FormBody({
    Key? key,
  }) : super(key: key);

  @override
  State<FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  double _currentSliderValue = 1;
  String text = '';
  @override
  Widget build(BuildContext context) {
    final entitiesProvider = Provider.of<EntitiesProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
        ),
        Text(
          "APPEDIA",
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    onChanged: (value) {
                      text = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Buscar",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Confianza: ${(_currentSliderValue / 100).toString()}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              entitiesProvider.loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonsDecoration.buttonPrimaryStyle(
                          context: context, elevation: 4),
                      onPressed: () async {
                        entitiesProvider.getApiResponse(text);
                        final result = await entitiesProvider.getAnnotations(
                            text, (_currentSliderValue / 100).toString());
                        if (result['rta'] && result['entities'].isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          entitiesProvider.searchText = text;
                          Navigator.pushNamed(context, "resultPage");
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Error"),
                              content:
                                  const Text("No se encontraron resultados"),
                              actions: [
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              ],
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: Text("Buscar"),
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
