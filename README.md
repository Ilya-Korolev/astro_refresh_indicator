
# Astro Refresh Indicator

<p align="center">
    <a href="https://pub.dev/packages/astro_refresh_indicator"><img src="https://img.shields.io/pub/v/astro_refresh_indicator.svg" alt="pub"></a>
    <a href="https://pub.dev/packages/very_good_analysis"><img src="https://img.shields.io/badge/style-very_good_analysis-B22C89.svg" alt="style: very good analysis"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="license: MIT"></a>
</p>

---

A Flutter package that implements a `RefreshIndicator`. This package is meant to be used along with [pull_to_refresh][pull_to_refresh_link] package.

<img src="https://user-images.githubusercontent.com/39079821/194400223-7bd52189-b460-4f19-8290-48215fd069c4.gif" width="50%"/>

## ⚙️ Getting started

Add the following lines to the pubspec.yaml:
```yaml
dependencies:
  astro_refresh_indicator: ^1.0.3
  pull_to_refresh: ^2.0.0
```

## 🚀 Usage


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
        // should be greater than the AstroRefreshIndicator height
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

## ❤️ Credits

#### Used packages:
* [rive][rive_link]
* [pull_to_refresh][pull_to_refresh_link]
* [very_good_analysis][very_good_analysis_link]

#### Used animations:
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
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
