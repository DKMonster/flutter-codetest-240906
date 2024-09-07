import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:codetest/pages/launches_page.dart';
import 'package:codetest/models/launch.dart';
import 'package:codetest/providers/launches_providers.dart';

void main() {
  testWidgets('LaunchesPage show loading indicator',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          launchesProvider.overrideWith((_) => Future.delayed(
                const Duration(seconds: 1),
                () => throw Exception('測試錯誤: 案例01'),
              )),
        ],
        child: const MaterialApp(home: LaunchesPage()),
      ),
    );

    // 驗證加載指示器是否顯示
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // 等待加載完成
    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('LaunchesPage show error message', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          launchesProvider.overrideWith(
            (_) => Future.error(Exception('測試錯誤: 案例02')),
          ),
        ],
        child: const MaterialApp(home: LaunchesPage()),
      ),
    );

    // 等待錯誤狀態
    await tester.pumpAndSettle();

    // 驗證錯誤消息是否顯示
    expect(find.text('資料載入失敗'), findsOneWidget);
  });

  testWidgets('LaunchesPage show the launches list',
      (WidgetTester tester) async {
    final launches = [
      Launch(
          flightNumber: 1,
          flightName: 'Flight 1',
          missionName: 'FalconSat',
          launchDate: '01/01/2023 12:00:00',
          missionPatch: 'https://images2.imgbox.com/40/e3/GypSkayF_o.png'),
      Launch(
          flightNumber: 2,
          flightName: 'Flight 2',
          missionName: 'DemoSat',
          launchDate: '02/01/2023 12:00:00',
          missionPatch: 'https://images2.imgbox.com/be/e7/iNqsqVYM_o.png'),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          launchesProvider.overrideWith((_) => Future.value(launches)),
        ],
        child: const MaterialApp(home: LaunchesPage()),
      ),
    );

    // 等待數據加載
    await tester.pumpAndSettle();

    // 驗證列表項是否正確顯示
    expect(find.text('Flight 1'), findsOneWidget);
    expect(find.text('FalconSat'), findsOneWidget);
    expect(find.text('Flight 2'), findsOneWidget);
    expect(find.text('DemoSat'), findsOneWidget);
  });
}
