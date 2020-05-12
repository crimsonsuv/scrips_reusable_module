import 'package:flutter/material.dart';
import 'package:scrips_core/base/screens/base_screen_view.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/pages/create_patient_screen.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';

class CreatePatientBaseScreen extends StatefulWidget {
  final PatientDatum pData;
  final Function doPop;
  final String orgId;
  final String practiceId;
  const CreatePatientBaseScreen({
    this.pData,
    this.doPop,
    this.practiceId,
    this.orgId,
    Key key,
  }) : super(key: key);

  @override
  _CreatePatientBaseScreenState createState() =>
      _CreatePatientBaseScreenState();
}

class _CreatePatientBaseScreenState extends State<CreatePatientBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenView(
      desktopBodyLandscape: CreatePatientScreen(
        pData: widget.pData,
        doPop: widget.doPop,
        practiceId: widget.practiceId,
        orgId: widget.orgId,
      ),
    );
  }
}
