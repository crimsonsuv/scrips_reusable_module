import 'dart:async';

import 'package:scrips_core/datamodels/firebase/stats.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();

  FirebaseService() {
    /* Firestore.instance
        .collection('informations')
        .document('project_stats')
        .snapshots()
        .listen(_statsUpdated);*/
  }

  Stream<Stats> get appStats => _statsController.stream;

  void _statsUpdated(/*DocumentSnapshot*/ var snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }
}
