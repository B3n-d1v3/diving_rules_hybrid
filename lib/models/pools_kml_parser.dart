import 'package:xml/xml.dart';

import 'pool_model.dart';

/// The Google My Maps map id backing the Pools feature.
/// https://www.google.com/maps/d/viewer?mid=$poolsMapId
const String poolsMapId = '1YoNE1BLzEf11IT5DVG4YscaCuOY';

/// Public (undocumented but stable) KML export endpoint for a My Maps map.
/// No auth required as long as the map is shared/public, as this one is.
String poolsKmlUrl({String mid = poolsMapId}) =>
    'https://www.google.com/maps/d/kml?mid=$mid&forcekml=1';

/// Parses the raw KML export of the Pools My Maps map into [Pool]s.
/// Pure Dart (no Flutter dependency) so it can also run from the
/// standalone `tool/fetch_pools_snapshot.dart` build-time script.
List<Pool> parsePoolsKml(String kmlContent) {
  final document = XmlDocument.parse(kmlContent);
  final pools = <Pool>[];
  var index = 0;

  for (final placemark in document.findAllElements('Placemark')) {
    final coordinatesText = placemark
        .getElement('Point')
        ?.getElement('coordinates')
        ?.innerText
        .trim();
    if (coordinatesText == null || coordinatesText.isEmpty) {
      continue;
    }
    final coordinateParts = coordinatesText.split(',');
    if (coordinateParts.length < 2) {
      continue;
    }
    final lng = double.tryParse(coordinateParts[0]);
    final lat = double.tryParse(coordinateParts[1]);
    if (lat == null || lng == null) {
      continue;
    }

    final name = placemark.getElement('name')?.innerText.trim() ?? '';
    final descriptionHtml =
        placemark.getElement('description')?.innerText.trim() ?? '';

    final imageUrls = <String>[];
    final extendedDataElements =
        placemark.getElement('ExtendedData')?.findElements('Data') ?? [];
    for (final data in extendedDataElements) {
      if (data.getAttribute('name') != 'gx_media_links') {
        continue;
      }
      final mediaLinksValue = data.getElement('value')?.innerText.trim() ?? '';
      imageUrls.addAll(
          mediaLinksValue.split(RegExp(r'\s+')).where((url) => url.isNotEmpty));
    }

    pools.add(Pool(
      id: 'pool_${index++}',
      name: name,
      descriptionHtml: descriptionHtml,
      imageUrls: imageUrls,
      lat: lat,
      lng: lng,
    ));
  }

  return pools;
}
