import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class StatsService {
  static const String _likesKey = 'likes_count';
  static const String _dislikesKey = 'dislikes_count';

  Future<void> saveStats({required int likes, required int dislikes}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_likesKey, likes);
    await prefs.setInt(_dislikesKey, dislikes);
  }

  Future<Map<String, int>> loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'likes': prefs.getInt(_likesKey) ?? 0,
      'dislikes': prefs.getInt(_dislikesKey) ?? 0,
    };
  }
}
