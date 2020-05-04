import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/usecases/archive_patiets_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/usecases/fetch_patients_use_case.dart';

import './bloc.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  @override
  PatientListState get initialState => InitialPatientListState();

  final FetchPatientsUseCase fetchPatientsUseCase;
  final ArchivePatientsUseCase archivePatientsUseCase;

  PatientListBloc({
    @required this.fetchPatientsUseCase,
    @required this.archivePatientsUseCase,
  });

  @override
  Stream<PatientListState> mapEventToState(
    PatientListEvent event,
  ) async* {
    if (event is SelectPatientItems) {
      yield SetItemSelection(indexs: event.indexs);
    } else if (event is PatientsFetchByQueryEvent) {
      yield LoadingBeginState();
      final result = await fetchPatientsUseCase(FetchPatientsParams(
          query: event.query,
          orgId: event.orgId,
          practiceId: event.practiceId,
          pageNum: event.pageNum,
          pageSize: event.pageSize,
          isArchived: event.isArchived));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => PracticeFetchByQueryState(success),
      );
    } else if (event is SortPatientItemsEvent) {
      yield SortedPatientItemsState(sort: event.sort);
    } else if (event is ChangeArchiveStatusEvent) {
      yield ChangeArchiveStatusState();
    } else if (event is ArchivePatientEvent) {
      yield LoadingBeginState();
      final result = await archivePatientsUseCase(
          ArchivePatientsParams(patientIDs: event.patientIDs));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => ArchivedPatientState(),
      );
    }
  }
}
