import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const OnixApp());
}

class OnixApp extends StatelessWidget {
  const OnixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ónix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
      ),
      home: const PruebaPage(),
    );
  }
}

/// Pantalla de prueba de compilación: confirma que la app arranca y que un
/// plugin nativo (path_provider) funciona en el dispositivo.
class PruebaPage extends StatelessWidget {
  const PruebaPage({super.key, this.loadDirectory = _documentsPath});

  final Future<String> Function() loadDirectory;

  static Future<String> _documentsPath() async =>
      (await getApplicationDocumentsDirectory()).path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ónix')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prueba de compilación',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Text('Si ves esta pantalla, la app se instaló y arrancó.'),
            const SizedBox(height: 16),
            FutureBuilder<String>(
              future: loadDirectory(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Plugin nativo: error (${snapshot.error})');
                }
                if (!snapshot.hasData) {
                  return const Text('Plugin nativo: comprobando...');
                }
                return Text('Plugin nativo: OK\n${snapshot.data}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
