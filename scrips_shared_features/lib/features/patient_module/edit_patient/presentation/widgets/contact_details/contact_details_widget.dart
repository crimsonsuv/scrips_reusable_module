import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/contact_details_form.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/emergency_contact/emergency_contacts_widget.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/health_insurance/health_insurance_widget.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/residential_address_form.dart';

class ContactDetailsWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Ownership> ownershipList;
  final List<Relationship> relationshipList;
  final List<Insurance> insuranceList;
  @override
  _ContactDetailsWidgetState createState() => _ContactDetailsWidgetState();
  ContactDetailsWidget(
      {this.bloc,
      this.isEdit,
      this.patient,
      this.ownershipList,
      this.insuranceList,
      this.relationshipList});
}

class _ContactDetailsWidgetState extends State<ContactDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: OKToast(
        child: BlocListener(
            bloc: widget.bloc,
            listener: (BuildContext context, state) {},
            child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
              bloc: widget.bloc,
              condition: (preSate, currSate) {
                if (currSate is EnablePatientSaveState ||
                    currSate is EnableSaveInsuranceState ||
                    currSate is EnableSaveEmergencyContactState) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return body(context);
              },
            )),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ContactDetailsFormWidget(
              patient: widget.patient,
              isEdit: widget.isEdit,
              bloc: widget.bloc,
              ownershipList: widget.ownershipList,
            ),
            Space(
              vertical: 24,
            ),
            ResidentialAddressFormWidget(
              patient: widget.patient,
              isEdit: widget.isEdit,
              bloc: widget.bloc,
            ),
            Space(
              vertical: 24,
            ),
            EmergencyContactsWidget(
              patient: widget.patient,
              isEdit: widget.isEdit,
              bloc: widget.bloc,
              relationshipList: widget.relationshipList,
            ),
            Space(
              vertical: 24,
            ),
            HealthInsuranceWidget(
              patient: widget.patient,
              isEdit: widget.isEdit,
              bloc: widget.bloc,
              insuranceList: widget.insuranceList,
            ),
            Space(
              vertical: 24,
            ),
          ],
        ),
      ),
    );
  }
}
