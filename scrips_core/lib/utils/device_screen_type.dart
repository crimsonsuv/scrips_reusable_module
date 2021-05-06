import 'package:flutter/widgets.dart';
import 'package:scrips_core/enums/screen_type.dart';

const double minWidthDesktop = 950.0;
const double minWidthTablet = 600.0;

ScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > minWidthDesktop) {
    return ScreenType.Desktop;
  }

  if (deviceWidth > minWidthTablet) {
    return ScreenType.Tablet;
  }

  return ScreenType.Mobile;
}

class OrientationType extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const OrientationType({
    Key key,
    this.portrait,
    this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery?.of(context)?.orientation;

    switch (orientation) {
      case Orientation.portrait:
        return portrait;
      case Orientation.landscape:
        return landscape;
      default:
        return portrait;
    }
  }
}

class DeviceSizingInformation {
  final ScreenType screenType;
  final Size screenSize;

  const DeviceSizingInformation({
    Key key,
    this.screenType,
    this.screenSize,
  });
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    DeviceSizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({
    Key key,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var mediaQuery = MediaQuery.of(context);
        var sizingInformation = DeviceSizingInformation(
          screenSize: mediaQuery.size,
          screenType: getDeviceType(
            mediaQuery,
          ),
        );

        return builder(context, sizingInformation);
      },
    );
  }
}

class DeviceLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const DeviceLayout({
    Key key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.screenType == ScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }

        if (sizingInformation.screenType == ScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }

        return mobile;
      },
    );
  }
}
