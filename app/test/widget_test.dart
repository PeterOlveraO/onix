import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:onix/main.dart';

void main() {
  testWidgets('la pantalla de prueba muestra el resultado del plugin', (
    tester,
  ) async {
    await tester.pumpWidget(const PruebaPageHarness());
    expect(find.text('Prueba de compilación'), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.textContaining('Plugin nativo: OK'), findsOneWidget);
  });
}

class PruebaPageHarness extends StatelessWidget {
  const PruebaPageHarness({super.key});

  static Future<String> _fakeDirectory() async => '/tmp/prueba';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PruebaPage(loadDirectory: _fakeDirectory));
  }
}
