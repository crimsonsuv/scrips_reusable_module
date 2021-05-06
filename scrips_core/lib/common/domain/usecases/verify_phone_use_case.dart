import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/data/datamodels/twilio_response_model.dart';
import 'package:scrips_core/common/domain/repository/common_repository.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';

class VerifyPhoneUseCase extends UseCase<TwilioResponse, VerifyPhoneParams> {
  CommonRepository repository;

  VerifyPhoneUseCase({@required this.repository});

  @override
  Future<Either<Failure, TwilioResponse>> call(VerifyPhoneParams params) {
    return repository.verifyPhone(phone: params.phone, country: params.country);
  }
}

class VerifyPhoneParams extends Equatable {
  final String phone;
  final String country;
  VerifyPhoneParams({
    @required this.phone,
    @required this.country,
  }) : super();

  @override
  List<Object> get props => [phone, country];
}
