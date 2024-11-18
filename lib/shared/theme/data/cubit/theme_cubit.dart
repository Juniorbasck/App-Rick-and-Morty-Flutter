import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ricka_and_morty/shared/theme/data/app_theme_repository.dart';

@injectable
class ThemeCubit extends Cubit<String> {
  ThemeCubit(this._repository) : super(_repository.theme ?? '');

  final AppThemeRepository _repository;

  void changeTheme(String themeName) {
    _repository.changeTheme(themeName);
    emit(themeName);
  }
}
