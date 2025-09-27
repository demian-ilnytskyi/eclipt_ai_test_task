import 'package:bloc/bloc.dart';
import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

@injectable
class IntroCubit extends Cubit<bool> {
  IntroCubit({required SharedPrefencesProvider sharedPrefencesProvider})
    : _sharedPrefencesProvider = sharedPrefencesProvider,
      super(false);
  final SharedPrefencesProvider _sharedPrefencesProvider;

  static const showedIntroKey = '__showed_intro_key__';

  Future<void> finish() async {
    await _sharedPrefencesProvider.setBool(key: showedIntroKey, value: true);
  }
}
