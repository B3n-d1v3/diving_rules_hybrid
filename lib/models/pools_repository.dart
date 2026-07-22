import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../nav_pools/pools_constants.dart' show mapReloadWeekly;
import 'pool_model.dart';
import 'pools_kml_parser.dart';

const String _poolsCacheFileName = 'pools_cache.json';
const String _poolsBundledAssetPath = 'assets/data/pools.json';

/// Where the pools shown to the user actually came from, so the UI can
/// tell the user when they're not looking at the live map.
enum PoolsSource { live, cache, bundled }

class PoolsLoadResult {
  final List<Pool> pools;
  final PoolsSource source;

  PoolsLoadResult(this.pools, this.source);
}

/// Loads pool data with a live-network-first, offline-friendly fallback
/// chain. Only ever called once, when the user opens the Pools tab - never
/// proactively in the background.
class PoolsRepository {
  // Shared across every PoolsRepository instance (a new one is created each
  // time the Pools tab is opened) so the mapReloadWeekly guard survives tab
  // switches within the same app run. Resets to null on app restart, which
  // is intentional - see mapReloadWeekly's doc comment.
  static DateTime? _lastLiveFetchAt;
  static List<Pool>? _lastLivePools;

  Future<PoolsLoadResult> loadPools() async {
    if (mapReloadWeekly &&
        _lastLivePools != null &&
        _lastLiveFetchAt != null &&
        DateTime.now().difference(_lastLiveFetchAt!) < const Duration(days: 7)) {
      return PoolsLoadResult(_lastLivePools!, PoolsSource.live);
    }

    try {
      final response = await http
          .get(Uri.parse(poolsKmlUrl()))
          .timeout(const Duration(seconds: 8));
      if (response.statusCode == 200) {
        final pools = parsePoolsKml(response.body);
        if (pools.isNotEmpty) {
          await _writeCache(pools);
          _lastLiveFetchAt = DateTime.now();
          _lastLivePools = pools;
          return PoolsLoadResult(pools, PoolsSource.live);
        }
      }
    } catch (_) {
      // No network, timed out, or the KML could not be parsed - fall back
      // to the last known good data below instead of surfacing an error.
    }

    final cached = await _readCache();
    if (cached != null && cached.isNotEmpty) {
      return PoolsLoadResult(cached, PoolsSource.cache);
    }

    final bundled = await _readBundled();
    return PoolsLoadResult(bundled, PoolsSource.bundled);
  }

  Future<File> _cacheFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_poolsCacheFileName');
  }

  Future<void> _writeCache(List<Pool> pools) async {
    try {
      final file = await _cacheFile();
      await file.writeAsString(poolsDataToJson(PoolsData(pools: pools)));
    } catch (_) {
      // Best-effort cache write - a read-only filesystem shouldn't break
      // showing the freshly fetched data for this session.
    }
  }

  Future<List<Pool>?> _readCache() async {
    try {
      final file = await _cacheFile();
      if (!await file.exists()) {
        return null;
      }
      return poolsDataFromJson(await file.readAsString()).pools;
    } catch (_) {
      return null;
    }
  }

  Future<List<Pool>> _readBundled() async {
    final content = await rootBundle.loadString(_poolsBundledAssetPath);
    return poolsDataFromJson(content).pools;
  }
}
