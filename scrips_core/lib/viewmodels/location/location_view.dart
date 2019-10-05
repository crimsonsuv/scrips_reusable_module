import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/datamodels/location/user_location.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child:
            PlatformText('Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
      ),
    );
  }
}
