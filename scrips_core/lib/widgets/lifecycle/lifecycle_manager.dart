import 'package:flutter/material.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/services/api/background_fetch_service.dart';
import 'package:scrips_core/services/api/stoppable_service.dart';

/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  // STEPS: Add stoppable services here from Locator

  List<StoppableService> servicesToManage = [];

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    StoppableService locationService;
    StoppableService backgroundFetchService;
    //
    try {
      backgroundFetchService = locator<BackgroundFetchService>();
    } catch (e) {
      print(e);
    }

    // check if services were instantiated)
    locationService != null
        ? servicesToManage.add(locationService)
        : print('No StoppableSevice Registered: Location service');

    //
    backgroundFetchService != null
        ? servicesToManage.add(backgroundFetchService)
        : print('No StoppableSevice Registered: BackgroundFetch Service');
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
