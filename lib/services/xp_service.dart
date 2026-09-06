import 'package:shared_preferences/shared_preferences.dart';

class XPService {
  static const String xpKey = 'user_xp';

  // বর্তমান XP পাওয়া
  static Future<int> getXP() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(xpKey) ?? 0;
  }

  // XP যোগ করা
  static Future<void> addXP(int amount) async {
    final prefs = await SharedPreferences.getInstance();

    final currentXP = prefs.getInt(xpKey) ?? 0;
    await prefs.setInt(xpKey, currentXP + amount);
  }

  // XP থেকে Level হিসাব করা
  static int getLevel(int xp) {
    return (xp ~/ 100) + 1;
  }

  // পরবর্তী Level-এর জন্য কত XP লাগবে
  static int getNextLevelXP(int xp) {
    final level = getLevel(xp);
    return level * 100;
  }
}
