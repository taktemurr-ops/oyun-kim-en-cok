import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kim_en_cok/oyun_kim_en_cok.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kimEnCokConfig.title.length, 33);
    expect(kimEnCokConfig.tagline.length, 33);
    for (final s in kimEnCokConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kimEnCokConfig.gameId, kimEnCokId);
    expect(kimEnCokRules.gameId, kimEnCokId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kimEnCokRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kimEnCokId, optionalMechanics: kimEnCokRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kimEnCokRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
