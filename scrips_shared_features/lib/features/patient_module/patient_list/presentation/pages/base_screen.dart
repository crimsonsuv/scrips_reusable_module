import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/base/screens/base_screen_view.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/pages/patient_list_screen.dart';

class PatientListBaseScreen extends StatefulWidget {
  const PatientListBaseScreen({
    this.pushEditPatient,
    this.pushCreatePatient,
    this.practiceId,
    this.orgId,
    Key key,
  }) : super(key: key);

  final PatientCallBack pushEditPatient;
  final Function pushCreatePatient;
  final String orgId;
  final String practiceId;

  @override
  _PatientListBaseScreenState createState() => _PatientListBaseScreenState();
}

class _PatientListBaseScreenState extends State<PatientListBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: PatientListScreen(
        pushCreatePatient: widget.pushCreatePatient,
        pushEditPatient: widget.pushEditPatient,
        orgId: widget.orgId,
        practiceId: widget.practiceId,
      ),
    );
  }
}
