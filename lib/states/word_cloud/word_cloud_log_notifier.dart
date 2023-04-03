import 'package:word_cloud/index.dart';

class WordCloudLogNotifier extends ChangeNotifier {
  String logString = '';

  void addLog(String newLog) {
    logString += newLog;
  }

  void clearLog() {
    logString = '';
    notifyListeners();
    super.notifyListeners();
  }
}
