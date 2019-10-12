import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:scrips_core/datamodels/location/user_location.dart';
import 'package:scrips_core/services/api/stoppable_service.dart';

class LocationService extends StoppableService {
  // Keep track of current Location
  UserLocation _currentLocation;
  Location location = Location();

  @override
  void start() {
    super.start();
    print('LocationService Started $serviceStopped');
  }

  @override
  void stop() {
    super.stop();
    print('LocationService Stopped $serviceStopped');
  }

  // Continuously emit location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  LocationService() {
    try {
      location.requestPermission().then((granted) {
        if (granted) {
          location.onLocationChanged().listen((locationData) {
            if (locationData != null) {
              _locationController.add(UserLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude,
              ));
            }
          });
        }
      });
    } catch (e) {
      print('LocationService.constructor error $e');
    }
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}
