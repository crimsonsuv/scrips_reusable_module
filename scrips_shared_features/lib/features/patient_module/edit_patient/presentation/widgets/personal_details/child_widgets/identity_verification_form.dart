import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/identity_child_widget.dart';

class IdentityVerificationFormWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final bool isEdit;
  final Patient patient;
  final int selectedPatientRecord;
  final List<MatchingPatient> matchingPatientRecords;
  final List<Gender> genderList;
  final List<IdType> idTypeList;
  final List<MaritalStatus> maritalStatusList;
  final List<LanguageValueSetList> languageList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;

  @override
  _IdentityVerificationFormWidgetState createState() =>
      _IdentityVerificationFormWidgetState();
  IdentityVerificationFormWidget(
      {this.selectedPatientRecord,
      this.matchingPatientRecords,
      this.bloc,
      this.patient,
      this.isEdit,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList,
      this.relationshipList,
      this.languageList,
      this.ownershipList,
      this.insuranceList});
}

class _IdentityVerificationFormWidgetState
    extends State<IdentityVerificationFormWidget> {
  bool isMatchingRecordsLoading = false;
  Timer _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormView(
      header: "IDENTITY VERIFICATION".toUpperCase(),
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 23),
      child: IdentityChildWidget(
        isGuardian: false,
        patient: widget.patient,
        isEdit: widget.isEdit,
        bloc: widget.bloc,
        selectedPatientRecord: widget.selectedPatientRecord,
        matchingPatientRecords: widget.matchingPatientRecords,
        languageList: widget.languageList,
        maritalStatusList: widget.maritalStatusList,
        genderList: widget.genderList,
        relationshipList: widget.relationshipList,
        ownershipList: widget.ownershipList,
        insuranceList: widget.insuranceList,
        idTypeList: widget.idTypeList,
      ),
    );
  }
}
