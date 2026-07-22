// Refreshes the bundled Pools snapshot (assets/data/pools.json) from the
// live Google My Maps KML export, so the app always ships with a recent
// offline fallback even if the device never gets a successful live fetch.
//
// Run before cutting a release, same idea as refreshing the bundled
// rulebook PDFs - there is no CI in this repo to automate it:
//   fvm dart run tool/fetch_pools_snapshot.dart

import 'dart:io';

import 'package:diving_rules_hybrid/models/pool_model.dart';
import 'package:diving_rules_hybrid/models/pools_kml_parser.dart';
import 'package:http/http.dart' as http;

const String _outputPath = 'assets/data/pools.json';

Future<void> main() async {
  stdout.writeln('Fetching pools KML from ${poolsKmlUrl()} ...');
  final response = await http.get(Uri.parse(poolsKmlUrl()));
  if (response.statusCode != 200) {
    stderr.writeln('Failed to fetch KML: HTTP ${response.statusCode}');
    exit(1);
  }

  final pools = parsePoolsKml(response.body);
  if (pools.isEmpty) {
    stderr.writeln('Parsed 0 pools from the KML - aborting without '
        'overwriting $_outputPath.');
    exit(1);
  }

  final file = File(_outputPath);
  await file.writeAsString(poolsDataToJson(PoolsData(pools: pools)));
  stdout.writeln('Wrote ${pools.length} pools to $_outputPath');
}
