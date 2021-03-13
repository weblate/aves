import 'dart:math';

import 'package:aves/model/settings/settings.dart';
import 'package:flutter/widgets.dart';

class TileExtentController {
  final String settingsRouteKey;
  final int columnCountMin, columnCountDefault;
  final double spacing, extentMin, extentMax;
  final ValueNotifier<double> extentNotifier = ValueNotifier(0);

  Size _viewportSize;

  Size get viewportSize => _viewportSize;

  TileExtentController({
    @required this.settingsRouteKey,
    this.columnCountMin = 2,
    @required this.columnCountDefault,
    @required this.extentMin,
    this.extentMax = 300,
    @required this.spacing,
  });

  void setViewportSize(Size viewportSize) {
    // sanitize screen size (useful when reloading while screen is off, reporting a 0,0 size)
    final viewportSizeMin = Size.square(extentMin * columnCountMin);
    // dimensions are rounded to prevent updates on minor changes
    // e.g. available space on S10e is `Size(360.0, 721.0)` when status bar is visible, `Size(360.0, 721.3)` when it is not
    final newViewportSize = Size(max(viewportSize.width, viewportSizeMin.width).roundToDouble(), max(viewportSize.height, viewportSizeMin.height).roundToDouble());
    if (_viewportSize != newViewportSize) {
      _viewportSize = newViewportSize;
      _update();
    }
  }

  double setUserPreferredExtent(double userPreferredExtent) => _update(userPreferredExtent: userPreferredExtent);

  double _update({double userPreferredExtent = 0}) {
    final oldUserPreferredExtent = settings.getTileExtent(settingsRouteKey);
    final currentExtent = extentNotifier.value;
    final targetExtent = userPreferredExtent > 0
        ? userPreferredExtent
        : oldUserPreferredExtent > 0
            ? oldUserPreferredExtent
            : currentExtent;

    final columnCount = getEffectiveColumnCountForExtent(targetExtent);
    final newExtent = _extentForColumnCount(columnCount);

    if (userPreferredExtent > 0 || oldUserPreferredExtent == 0) {
      settings.setTileExtent(settingsRouteKey, newExtent);
    }
    if (extentNotifier.value != newExtent) {
      extentNotifier.value = newExtent;
    }
    return newExtent;
  }

  double _extentMax() => min(extentMax, (viewportSize.shortestSide - spacing * (columnCountMin - 1)) / columnCountMin);

  double _columnCountForExtent(double extent) => (viewportSize.width + spacing) / (extent + spacing);

  double _extentForColumnCount(int columnCount) => (viewportSize.width - spacing * (columnCount - 1)) / columnCount;

  int _effectiveColumnCountMin() => _columnCountForExtent(_extentMax()).ceil();

  int _effectiveColumnCountMax() => _columnCountForExtent(extentMin).floor();

  double get effectiveExtentMin => _extentForColumnCount(_effectiveColumnCountMax());

  double get effectiveExtentMax => _extentForColumnCount(_effectiveColumnCountMin());

  int getEffectiveColumnCountForExtent(double extent) {
    if (extent > 0) {
      final columnCount = _columnCountForExtent(extent);
      return columnCount.clamp(_effectiveColumnCountMin(), _effectiveColumnCountMax()).round();
    }
    return columnCountDefault;
  }
}
