import 'package:flutter/material.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/api/background_fetch_service.dart';
import 'package:scrips_core/services/api/location_service.dart';
import 'package:scrips_core/services/api/stoppable_service.dart';

/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  // STEPS: Add stoppable services here from Locator
  List<StoppableService> servicesToManage = [
    locator<LocationService>(),
    locator<BackgroundFetchService>(),
  ];

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service) {
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    });
  }
}
