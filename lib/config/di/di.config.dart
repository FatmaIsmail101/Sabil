// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/quran/data/api/quran_client.dart' as _i927;
import '../../features/quran/data/data_source/quran_data_source_contract.dart'
    as _i690;
import '../../features/quran/data/data_source/quran_data_source_impl.dart'
    as _i85;
import '../../features/quran/data/repo/quran_repo_impl.dart' as _i864;
import '../../features/quran/domain/repo/quran_repo_contract.dart' as _i669;
import '../../features/quran/domain/use_case/quran_use_case.dart' as _i570;
import '../../features/quran/presentation/view_model/quran_view_model.dart'
    as _i118;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i690.QuranDataSourceContract>(() => _i85.QuranDataSourceImpl());
    gh.factory<_i927.QuranClient>(() => _i927.QuranClient(gh<_i361.Dio>()));
    gh.factory<_i669.QuranRepoContract>(
      () => _i864.QuranRepoImpl(gh<_i690.QuranDataSourceContract>()),
    );
    gh.factory<_i570.QuranUseCase>(
      () => _i570.QuranUseCase(gh<_i669.QuranRepoContract>()),
    );
    gh.factory<_i118.QuranViewModel>(
      () => _i118.QuranViewModel(gh<_i570.QuranUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
