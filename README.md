
# Astro Refresh Indicator

[![pub package][pub_badge]][pub_badge_link]
[![License: MIT][license_badge]][license_link]

A Flutter package that implements a `RefreshIndicator`. This package is meant to be used along with [pull_to_refresh][pull_to_refresh_link] package.

## Installation

Add the following lines to the pubspec.yaml:
```yaml
dependencies:
  astro_refresh_indicator: ^1.0.0
  pull_to_refresh: ^2.0.0
```

## Example

<img src="https://user-images.githubusercontent.com/39079821/131216193-ab5aad5d-bf3a-4297-9dc5-3439e9f979a1.gif" width="33%" height="33%"/>

```dart
  final RefreshController _refreshController = RefreshController();

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 3000));

    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshConfiguration(
        // should be greater than AstroRefreshIndicator height
        headerTriggerDistance: 155,
        child: SmartRefresher(
          header: const AstroRefreshIndicator(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemBuilder: (c, i) => const Card(),
            itemExtent: 200,
            itemCount: 5,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
```

## Credits

#### Packages used:
* [rive][rive_link]
* [pull_to_refresh][pull_to_refresh_link]
* [very_good_analysis][very_good_analysis_link]

#### Animation:
* [Interactive animations][animation_link]

## License 
Licensed under the [MIT License][license_link].

[pub_badge]: https://img.shields.io/pub/v/astro_refresh_indicator.svg
[pub_badge_link]: https://pub.dartlang.org/packages/astro_refresh_indicator
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[pull_to_refresh_link]: https://pub.dev/packages/pull_to_refresh
[rive_link]: https://pub.dev/packages/rive
[animation_link]: https://rive.app/community/516-982-interactive-animations/
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
