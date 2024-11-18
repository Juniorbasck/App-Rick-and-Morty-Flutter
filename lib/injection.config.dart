// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ricka_and_morty/character/domain/character_interactor.dart'
    as _i596;
import 'package:ricka_and_morty/character/presentation/bloc/character_bloc.dart'
    as _i861;
import 'package:ricka_and_morty/character/service/character_repository.dart'
    as _i609;
import 'package:ricka_and_morty/character/service/character_service.dart'
    as _i616;
import 'package:ricka_and_morty/network/network_module.dart' as _i53;
import 'package:ricka_and_morty/preferences/preferences_module.dart' as _i564;
import 'package:ricka_and_morty/shared/theme/data/app_theme_repository.dart'
    as _i294;
import 'package:ricka_and_morty/shared/theme/data/cubit/theme_cubit.dart'
    as _i254;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final preferencesModule = _$PreferencesModule();
  final networkModule = _$NetworkModule();
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => preferencesModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i294.AppThemeRepository>(
      () => _i294.AppThemeRepositoryimpl(gh<_i460.SharedPreferences>()));
  gh.factory<_i361.Interceptor>(
    () => networkModule.providerPrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.singleton<_i361.Dio>(() => networkModule.providerDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<_i361.Interceptor>(instanceName: 'PrettyLogger'),
      ));
  gh.factory<_i254.ThemeCubit>(
      () => _i254.ThemeCubit(gh<_i294.AppThemeRepository>()));
  gh.factory<_i616.CharacterService>(
      () => _i616.CharacterServiceImpl(gh<_i361.Dio>()));
  gh.factory<_i609.CharacterRepository>(
      () => _i609.CharacterRepositoryImpl(gh<_i616.CharacterService>()));
  gh.factory<_i596.CharacterInteractor>(
      () => _i596.CharacterInteractorImpl(gh<_i609.CharacterRepository>()));
  gh.factory<_i861.CharacterBloc>(
      () => _i861.CharacterBloc(gh<_i596.CharacterInteractor>()));
  return getIt;
}

class _$PreferencesModule extends _i564.PreferencesModule {}

class _$NetworkModule extends _i53.NetworkModule {}
