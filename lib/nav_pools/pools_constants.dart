/// Google Form used by the "Add new pool" AppBar button to let users
/// propose a pool to add to the map.
const String poolsSubmissionFormUrl = 'https://forms.gle/rqVhLC5KRYR2b3ku6';

/// Controls how often the Pools map re-fetches the live KML data:
/// - `false` (testing): the map re-fetches from the network every time the
///   Pools tab is opened, so content changes are visible immediately.
/// - `true` (production): the map fetches live data at most once every 7
///   days; reopening the Pools tab sooner than that reuses this run's
///   already-fetched data instead of hitting the network again. Restarting
///   the app always resets this guard, so a restart within the same week
///   still fetches fresh data once.
const bool mapReloadWeekly = false;
