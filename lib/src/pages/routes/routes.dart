import 'package:flutter/material.dart';

import '../home/home.dart';
import '../result_page.dart/result_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => const HomePage(),
    'resultPage': (_) => const ResultPage(),
  };
}
