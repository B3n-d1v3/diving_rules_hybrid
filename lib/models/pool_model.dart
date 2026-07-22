import 'dart:convert';

// To parse this JSON data, do
//     final poolsData = poolsDataFromJson(jsonString);

PoolsData poolsDataFromJson(String str) => PoolsData.fromJson(json.decode(str));

String poolsDataToJson(PoolsData data) => json.encode(data.toJson());

class PoolsData {
  List<Pool> pools;

  PoolsData({
    required this.pools,
  });

  factory PoolsData.fromJson(Map<String, dynamic> json) => PoolsData(
        pools: List<Pool>.from(json["pools"].map((x) => Pool.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pools": List<dynamic>.from(pools.map((x) => x.toJson())),
      };
}

class Pool {
  String id;
  String name;
  String descriptionHtml;
  List<String> imageUrls;
  double lat;
  double lng;

  Pool({
    required this.id,
    required this.name,
    required this.descriptionHtml,
    required this.imageUrls,
    required this.lat,
    required this.lng,
  });

  factory Pool.fromJson(Map<String, dynamic> json) => Pool(
        id: json["id"],
        name: json["name"],
        descriptionHtml: json["descriptionHtml"],
        imageUrls: List<String>.from(json["imageUrls"] ?? []),
        lat: (json["lat"] as num).toDouble(),
        lng: (json["lng"] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "descriptionHtml": descriptionHtml,
        "imageUrls": imageUrls,
        "lat": lat,
        "lng": lng,
      };

  // The raw map data title is always structured as
  // "(department code) - CITY NAME - Pool name", e.g.
  // "(75) - PARIS - Piscine Georges Hermant". The department/city separator
  // is always " - " (spaces around the dash); city names that are
  // themselves hyphenated (e.g. "VALLONS-DE-L'ERDRE") use a bare "-", so
  // splitting on the spaced form only cleanly isolates the three fields.
  static final RegExp _departmentPrefixPattern = RegExp(r'^\((.+?)\)\s*-\s*(.+)$');

  String get _cityAndPoolName {
    final match = _departmentPrefixPattern.firstMatch(name);
    return match?.group(2) ?? name;
  }

  /// e.g. "01", "75", "2A".
  String get departmentCode {
    final match = _departmentPrefixPattern.firstMatch(name);
    return match?.group(1) ?? '';
  }

  /// e.g. "PARIS" (raw, upper-case as in the source data).
  String get cityName {
    final rest = _cityAndPoolName;
    final separatorIndex = rest.indexOf(' - ');
    return separatorIndex == -1 ? rest : rest.substring(0, separatorIndex);
  }

  /// e.g. "Piscine Georges Hermant" - the pool's own name, kept as
  /// originally cased since (unlike the city) it isn't all-caps in the
  /// source data.
  String get poolName {
    final rest = _cityAndPoolName;
    final separatorIndex = rest.indexOf(' - ');
    return separatorIndex == -1 ? rest : rest.substring(separatorIndex + 3);
  }

  /// [cityName] title-cased for display, e.g. "PARIS" -> "Paris",
  /// "VALLONS-DE-L'ERDRE" -> "Vallons-De-L'Erdre".
  String get cityNameTitleCase => _toTitleCase(cityName);
}

String _toTitleCase(String input) {
  final buffer = StringBuffer();
  var capitalizeNext = true;
  for (final char in input.toLowerCase().split('')) {
    if (capitalizeNext && RegExp(r'[a-zà-öø-ÿ]', caseSensitive: false).hasMatch(char)) {
      buffer.write(char.toUpperCase());
      capitalizeNext = false;
    } else {
      buffer.write(char);
    }
    capitalizeNext = capitalizeNext || char == ' ' || char == '-' || char == "'";
  }
  return buffer.toString();
}
