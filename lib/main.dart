import 'package:word_cloud/index.dart';

final wordCloudProfileNotifier = WordCloudProfileNotifier();
final wordCloudLogNotifier = WordCloudLogNotifier();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() =>
    wordCloudProfileNotifier.init().then((e) => runApp(const WordCloudApp()));

class WordCloudApp extends StatelessWidget {
  const WordCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Saira',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: 'Saira',
      ),
      home: const WordCloudSplashPage(),
    );
  }
}
