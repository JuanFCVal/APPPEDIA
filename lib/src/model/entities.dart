// To parse this JSON data, do
//
//     final entities = entitiesFromMap(jsonString);

import 'dart:convert';

Entities entitiesFromMap(String str) => Entities.fromMap(json.decode(str));

String entitiesToMap(Entities data) => json.encode(data.toMap());

class Entities {
  Entities({
    this.text,
    this.confidence,
    this.support,
    this.types,
    this.sparql,
    this.policy,
    required this.resources,
  });

  String? text;
  String? confidence;
  String? support;
  String? types;
  String? sparql;
  String? policy;
  List<Resource> resources;

  factory Entities.fromMap(Map<String, dynamic> json) => Entities(
        text: json["@text"],
        confidence: json["@confidence"],
        support: json["@support"],
        types: json["@types"],
        sparql: json["@sparql"],
        policy: json["@policy"],
        resources: List<Resource>.from(
            json["Resources"].map((x) => Resource.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "@text": text,
        "@confidence": confidence,
        "@support": support,
        "@types": types,
        "@sparql": sparql,
        "@policy": policy,
        "Resources": List<dynamic>.from(resources.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'Entities{text: $text, confidence: $confidence, support: $support, types: $types, sparql: $sparql, policy: $policy, resources: $resources}';
  }
}

class Resource {
  Resource({
    required this.uri,
    required this.support,
    required this.types,
    required this.surfaceForm,
    this.offset,
    this.similarityScore,
    this.percentageOfSecondRank,
  });

  String uri;
  String support;
  String types;
  String surfaceForm;
  String? offset;
  String? similarityScore;
  String? percentageOfSecondRank;

  factory Resource.fromMap(Map<String, dynamic> json) => Resource(
        uri: json["@URI"],
        support: json["@support"],
        types: json["@types"],
        surfaceForm: json["@surfaceForm"],
        offset: json["@offset"],
        similarityScore: json["@similarityScore"],
        percentageOfSecondRank: json["@percentageOfSecondRank"],
      );

  Map<String, dynamic> toMap() => {
        "@URI": uri,
        "@support": support,
        "@types": types,
        "@surfaceForm": surfaceForm,
        "@offset": offset,
        "@similarityScore": similarityScore,
        "@percentageOfSecondRank": percentageOfSecondRank,
      };

  getTypesList() {
    return types.split(",");
  }

  getUri() {
    final url = (uri.replaceAll("http", "https"));
    return Uri.parse(url);
  }

  @override
  String toString() {
    return 'Resource{uri: $uri, support: $support, types: $types, surfaceForm: $surfaceForm, offset: $offset, similarityScore: $similarityScore, percentageOfSecondRank: $percentageOfSecondRank}';
  }
}
