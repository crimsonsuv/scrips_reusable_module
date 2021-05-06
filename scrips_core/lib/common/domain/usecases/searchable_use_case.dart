import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/usecase/usecase.dart';

/// base use case for searching/query items
abstract class SearchableUseCase<T, P extends QueryParams>
    extends UseCase<List<T>, P> {
  //CommonRepository repository;

//  SearchableUseCase({@required this.repository});
  SearchableUseCase();

//  @override
//  Future<Either<Failure, T>> call(FetchLocationsByQueryParams params) {
//    return repository.fetchLocationsByQuery(
//        query: params.query, type: params.type);
//  }
}
