import 'package:exlipt_ai_test_task/shared/shared_dart.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserSettingCacheRepository {
  const UserSettingCacheRepository({
    required SharedPrefencesProvider sharedPrefencesProvider,
  }) : _sharedPrefencesProvider = sharedPrefencesProvider;
  final SharedPrefencesProvider _sharedPrefencesProvider;

  static const _messageCacheKey = '__nessage_cache_key';
  void updateUserCache(UserSetting currentUserSetting) {
    _checkIfCacheNeedUpdate(
      currentValue: currentUserSetting.message,
      cacheKey: _messageCacheKey,
    );
  }

  void _checkIfCacheNeedUpdate({
    required String? currentValue,
    required String cacheKey,
  }) {
    final cacheValue = _sharedPrefencesProvider.getString(cacheKey);
    if (currentValue != cacheValue) {
      if (currentValue == null) {
        _sharedPrefencesProvider.remove(cacheKey);
      } else {
        _sharedPrefencesProvider.setString(key: cacheKey, value: currentValue);
      }
    }
  }

  UserSetting get getCacheUserSetting => UserSetting(
    id: '',
    updatedAt: null,
    createdAt: null,
    message: _sharedPrefencesProvider.getString(_messageCacheKey),
  );

  void clearUserSettingCache() {
    _sharedPrefencesProvider.remove(_messageCacheKey);
  }
}
