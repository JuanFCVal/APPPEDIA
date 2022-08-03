// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);
import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    required this.result,
  });

  final Result result;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
  @override
  String toString() {
    return 'ApiResponse{result: $result}';
  }
}

class Result {
  Result({
    required this.idiomResult,
  });

  final IdiomResult idiomResult;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        idiomResult: IdiomResult.fromJson(json["idiomResult"]),
      );

  Map<String, dynamic> toJson() => {
        "idiomResult": idiomResult.toJson(),
      };
  @override
  String toString() {
    return 'Result{idiomResult: $idiomResult}';
  }
}

// class EnEntities {
//   EnEntities({
//     @required this.ecuadorBeautifulCountry,
//     @required this.worldAmazingPlaceLive,
//   });

//   final EcuadorBeautifulCountry ecuadorBeautifulCountry;
//   final EcuadorBeautifulCountry worldAmazingPlaceLive;

//   factory EnEntities.fromJson(Map<String, dynamic> json) => EnEntities(
//         ecuadorBeautifulCountry: EcuadorBeautifulCountry.fromJson(
//             json["Ecuador beautiful country "]),
//         worldAmazingPlaceLive:
//             EcuadorBeautifulCountry.fromJson(json["World amazing place live "]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Ecuador beautiful country ": ecuadorBeautifulCountry.toJson(),
//         "World amazing place live ": worldAmazingPlaceLive.toJson(),
//       };
// }

// class EcuadorBeautifulCountry {
//   EcuadorBeautifulCountry({
//     @required this.entities,
//     @required this.values,
//   });

//   final List<List<String>> entities;
//   final List<Value> values;

//   factory EcuadorBeautifulCountry.fromJson(Map<String, dynamic> json) =>
//       EcuadorBeautifulCountry(
//         entities: List<List<String>>.from(
//             json["entities"].map((x) => List<String>.from(x.map((x) => x)))),
//         values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "entities": List<dynamic>.from(
//             entities.map((x) => List<dynamic>.from(x.map((x) => x)))),
//         "values": List<dynamic>.from(values.map((x) => x.toJson())),
//       };
// }

// class Value {
//   Value({
//     @required this.uri,
//     @required this.support,
//     @required this.types,
//     @required this.surfaceForm,
//     @required this.offset,
//     @required this.similarityScore,
//     @required this.percentageOfSecondRank,
//   });

//   final String uri;
//   final String support;
//   final String types;
//   final String surfaceForm;
//   final String offset;
//   final String similarityScore;
//   final String percentageOfSecondRank;

//   factory Value.fromJson(Map<String, dynamic> json) => Value(
//         uri: json["@URI"],
//         support: json["@support"],
//         types: json["@types"],
//         surfaceForm: json["@surfaceForm"],
//         offset: json["@offset"],
//         similarityScore: json["@similarityScore"],
//         percentageOfSecondRank: json["@percentageOfSecondRank"],
//       );

//   Map<String, dynamic> toJson() => {
//         "@URI": uri,
//         "@support": support,
//         "@types": types,
//         "@surfaceForm": surfaceForm,
//         "@offset": offset,
//         "@similarityScore": similarityScore,
//         "@percentageOfSecondRank": percentageOfSecondRank,
//       };
// }

// class EsEntities {
//   EsEntities({
//     @required this.colombiaPasHermoso,
//     @required this.islasGalpagosDeberanMaravillasMundo,
//     @required this.gustaraVisitarParsFranciaBelga,
//   });

//   final EcuadorBeautifulCountry colombiaPasHermoso;
//   final EcuadorBeautifulCountry islasGalpagosDeberanMaravillasMundo;
//   final EcuadorBeautifulCountry gustaraVisitarParsFranciaBelga;

//   factory EsEntities.fromJson(Map<String, dynamic> json) => EsEntities(
//         colombiaPasHermoso:
//             EcuadorBeautifulCountry.fromJson(json["Colombia país hermoso "]),
//         islasGalpagosDeberanMaravillasMundo: EcuadorBeautifulCountry.fromJson(
//             json["islas Galápagos deberían maravillas mundo "]),
//         gustaraVisitarParsFranciaBelga: EcuadorBeautifulCountry.fromJson(
//             json["gustaría visitar París Francia Belga "]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Colombia país hermoso ": colombiaPasHermoso.toJson(),
//         "islas Galápagos deberían maravillas mundo ":
//             islasGalpagosDeberanMaravillasMundo.toJson(),
//         "gustaría visitar París Francia Belga ":
//             gustaraVisitarParsFranciaBelga.toJson(),
//       };
// }

class IdiomResult {
  IdiomResult({
    required this.en,
    required this.es,
    required this.removedStopWordsEn,
    required this.removedStopWordsEs,
  });

  final List<String> en;
  final List<String> es;
  final List<String> removedStopWordsEn;
  final List<String> removedStopWordsEs;

  factory IdiomResult.fromJson(Map<String, dynamic> json) => IdiomResult(
        en: List<String>.from(json["en"].map((x) => x)),
        es: List<String>.from(json["es"].map((x) => x)),
        removedStopWordsEn:
            List<String>.from(json["removedStopWordsEN"].map((x) => x)),
        removedStopWordsEs:
            List<String>.from(json["removedStopWordsES"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "en": List<dynamic>.from(en.map((x) => x)),
        "es": List<dynamic>.from(es.map((x) => x)),
        "removedStopWordsEN":
            List<dynamic>.from(removedStopWordsEn.map((x) => x)),
        "removedStopWordsES":
            List<dynamic>.from(removedStopWordsEs.map((x) => x)),
      };
  @override
  String toString() {
    return 'IdiomResult{en: $en, es: $es, removedStopWordsEn: $removedStopWordsEn, removedStopWordsEs: $removedStopWordsEs}';
  }
}
